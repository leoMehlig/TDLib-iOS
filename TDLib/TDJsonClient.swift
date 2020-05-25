import TDJSON

/// This is a wrapper around [TDJSON](https://github.com/leoMehlig/TDJSON).
/// It is responsible for creating a C `td_json_client`, sending request and receiving it's updates.
/// The update data can be accessed by subscribing to `TDJsonClient.stream`.
/// It is recommended to let the `Coordinator` manage the `TDJsonClient` and to never to use `TDJsonClient` directly.
public class TDJsonClient {
    /// The log verbosity level of the `tdlib`.
    public enum LogLevel: Int32 {
        case fatalErrors = 0, errors, warnings, info, debug, verbose, all = 1024
    }

    private let queue = DispatchQueue(label: "tdjsonclient", qos: .userInitiated)
    private let streamQueue = DispatchQueue(label: "tdjsonclient_stream", qos: .userInitiated)

    /// The raw C `td_json_client`. It is recommended to use it.
    public let rawClient = td_json_client_create()! //swiftlint:disable:this force_unwrapping

    /// The `Stream` of the `Data` received from `tdjson`.
    public let stream = Stream<Data?>()

    /// Whether the object is still receiving data from `tdjson`.
    public private(set) var isListing = true

    public var isRunning = false

    /// Sets the log verbosity level of the `tdlib`.
    public var logLevel: LogLevel = .warnings {
        didSet {
            td_set_log_verbosity_level(self.logLevel.rawValue)
        }
    }

    public var logPath: String? {
        didSet {
            if let path = self.logPath {
                _ = td_set_log_file_path(path)
            }
        }
    }

    /// Initiates a new `TDJsonClient`, that immediately starts receiving data from `tdlib`.
    public init() {
        td_set_log_verbosity_level(self.logLevel.rawValue)

        self.queue.async { [weak self] in
            while self?.isListing ?? false {
                if let client = self?.rawClient,
                    let response = td_json_client_receive(client: client, timeout: 10) {
                    self?.streamQueue.async {
                        if let data = response.data(using: .utf8) {
                            self?.stream.current = data
                        }
                    }
                }
            }
        }
    }

    /// Sends a request to `tdlib`. The `JSONDecoder.td` will be used to encode the json.
    /// Use `@extra` to later identify the response.
    ///
    /// - Parameter encodable: A `encodable` request object.
    /// - Throws: An error if something goes wrong during the encoding.
    public func send<T: Encodable>(_ encodable: T) throws {
        let json = try JSONEncoder.td.encode(encodable)
        self.send(String(data: json, encoding: .utf8) ?? "")
    }

    /// Send a request to `tdlib`.
    /// Use `@extra` to later identify the response.
    ///
    /// - Parameter query: A json encoded request.
    public func send(_ query: String) {
//        print("Send: \(query)")
        td_json_client_send(client: self.rawClient, request: query)
    }

    /// Executes a request synchronously. Can only be used for certain request.
    ///
    /// - Parameter query: A json encoded request
    /// - Returns: The result of the request, or nil.
    public func execute(_ query: String) -> String? {
        return td_json_client_execute(client: self.rawClient, request: query)
    }

    /// Stops receiving data from `tdlib` and destroys the `td_json_client`.
    public func close() {
        
        if self.isListing {
            self.isListing = false
        }
        
        queue.sync { [weak self] in
            guard let strongSelf = self else {
                return
            }
                    
            if strongSelf.isRunning {
                strongSelf.isRunning = false
                td_json_client_destroy(client: strongSelf.rawClient)
            }
        }   
    }
    
    deinit {
        self.close()
    }
}
