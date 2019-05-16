public class FloodStream: Stream<Foundation.Date?> {
    private let queue: DispatchQueue = DispatchQueue(label: "file_stream", qos: .utility)
    private var source: DispatchSourceFileSystemObject?
    private var lastId: Int?
    //swiftlint:disable:next force_unwrapping
    private let regex = (try? NSRegularExpression(pattern: "\\[id:(\\d+?)].+?\\[total_timeout:([\\d\\.]+)]", options: []))!

    init(logPath: String) {
        super.init()
        let fileSystemRepresentation = (logPath as NSString).fileSystemRepresentation

        // Obtain a descriptor from the file system
        let fileDescriptor = open(fileSystemRepresentation, O_EVTONLY)

        // Create our dispatch source
        let source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: fileDescriptor,
                                                               eventMask: .write,
                                                               queue: self.queue)

        // Assign the closure to it, and resume it to start observing
        source.setEventHandler(handler: { [weak self] in
            do {
                let log = try String(contentsOfFile: logPath)
                for line in log.components(separatedBy: .newlines).reversed() {
                    let string = (line as NSString)
                    //swiftlint:disable:next legacy_constructor
                    if let match = self?.regex.firstMatch(in: line, options: [], range: NSMakeRange(0, string.length)),
                        match.numberOfRanges >= 3,
                        let id = Int(string.substring(with: match.range(at: 1))) {
                        if id == self?.lastId {
                            return
                        } else {
                            let delay = Double(string.substring(with: match.range(at: 2))) ?? 0
                            self?.lastId = id
                            let date = Foundation.Date(timeIntervalSinceNow: delay + 1)
                            if let oldDate = self?.current, date.timeIntervalSince(oldDate) <= 1 {
                                print("Skipping new flood \(delay) - \(id)")
                            } else {
                                print("Flood Delay \(delay) - \(id)")
                                self?.current = date
                            }
                        }
                    }
                }
            } catch {

            }
        })
        source.resume()
        self.source = source
    }
}
