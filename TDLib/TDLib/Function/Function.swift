public protocol TDFunction: Encodable {
    associatedtype T: FunctionResult
    var type: String { get }
}

public protocol FunctionResult: Decodable {
    static var type: String { get }
}

public struct Ok: FunctionResult {
    public static var type: String = "ok"
}

struct FunctionWrapper<F: TDFunction>: Encodable {
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
        try container.encode(self.function.type, forKey: .type)
        try container.encode(self.extra, forKey: .extra)
        try self.function.encode(to: encoder)
    }
}
