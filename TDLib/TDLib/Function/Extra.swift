internal struct Extra: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case extra = "@extra"
    }
    
    let type: String
    let extra: String

    init(type: String, extra: String) {
        self.type = type
        self.extra = extra
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.extra = try container.decode(String.self, forKey: .extra)
    }
}
