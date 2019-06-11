public protocol TDFunction: Encodable {
    associatedtype Result: FunctionResult
    static var type: String { get }
}

public protocol FunctionResult: Decodable {
    static var type: String { get }
}

public extension FunctionResult {
    static var type: String {
        return "\(self)".uncapitalized
    }
}

public extension TDFunction {
    static var type: String {
        return "\(self)".uncapitalized
    }
}
public protocol TDEnum { }
public protocol EquatableEnum { }

public extension String {
    var uncapitalized: String {
        if let first = self.first {
            return String(first).lowercased() + String(self.dropFirst())
        } else {
            return self
        }
    }
}

internal struct FunctionWrapper<F: TDFunction>: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case extra = "@extra"
    }

    let function: F
    let extra: String = UUID().uuidString

    public init(function: F) {
        self.function = function
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(F.type, forKey: .type)
        try container.encode(self.extra, forKey: .extra)
        try self.function.encode(to: encoder)
    }
}
