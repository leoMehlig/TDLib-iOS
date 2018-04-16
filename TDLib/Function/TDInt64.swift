public struct TDInt64: Codable, SignedInteger {

    var storage: Int64

    private init(_ storage: Int64) {
        self.storage = storage
    }

    public init(from decoder: Decoder) throws {
        guard let storage = Int64(try decoder.singleValueContainer().decode(String.self)) else {
            throw DecodingError.typeMismatch(Int64.self,
                                             .init(codingPath: decoder.codingPath,
                                                   debugDescription: "Does not match type of string-wrapped Int64"))
        }
        self.storage = storage
    }

     public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(self.storage)")
    }

    public static var bitWidth: Int {
        return Int64.bitWidth
    }

    public func addingReportingOverflow(_ rhs: TDInt64) -> (partialValue: TDInt64, overflow: Bool) {
        let result = self.storage.addingReportingOverflow(rhs.storage)
        return (TDInt64(result.partialValue), result.overflow)
    }

    public func subtractingReportingOverflow(_ rhs: TDInt64) -> (partialValue: TDInt64, overflow: Bool) {
        let result = self.storage.subtractingReportingOverflow(rhs.storage)
        return (TDInt64(result.partialValue), result.overflow)
    }

    public func multipliedReportingOverflow(by rhs: TDInt64) -> (partialValue: TDInt64, overflow: Bool) {
        let result = self.storage.multipliedReportingOverflow(by: rhs.storage)
        return (TDInt64(result.partialValue), result.overflow)
    }

    public func dividedReportingOverflow(by rhs: TDInt64) -> (partialValue: TDInt64, overflow: Bool) {
        let result = self.storage.dividedReportingOverflow(by: rhs.storage)
        return (TDInt64(result.partialValue), result.overflow)
    }

    public func remainderReportingOverflow(dividingBy rhs: TDInt64) -> (partialValue: TDInt64, overflow: Bool) {
        let result = self.storage.remainderReportingOverflow(dividingBy: rhs.storage)
        return (TDInt64(result.partialValue), result.overflow)
    }

    public func multipliedFullWidth(by other: TDInt64) -> (high: TDInt64, low: TDInt64.Magnitude) {
        let result = self.storage.multipliedFullWidth(by: other.storage)
        return (TDInt64(result.high), result.low)
    }

    public func dividingFullWidth(_ dividend: (high: TDInt64, low: TDInt64.Magnitude)) -> (quotient: TDInt64, remainder: TDInt64) {
        let result = self.storage.dividingFullWidth((dividend.high.storage, dividend.low))
        return (TDInt64(result.quotient), TDInt64(result.remainder))
    }

    public var nonzeroBitCount: Int {
        return self.storage.nonzeroBitCount
    }

    public var leadingZeroBitCount: Int {
        return self.storage.leadingZeroBitCount
    }

    public var byteSwapped: TDInt64 {
        return TDInt64(self.storage.byteSwapped)
    }

    public typealias Words = Int64.Words

    public typealias Magnitude = Int64.Magnitude

    public typealias IntegerLiteralType = Int64.IntegerLiteralType

    public init?<T>(exactly source: T) where T: BinaryFloatingPoint {
        guard let storage = Int64(exactly: source) else {
            return nil
        }
        self.storage = storage
    }

    public init<T>(_ source: T) where T: BinaryFloatingPoint {
        self.storage = Int64(source)
    }

    public init<T>(_ source: T) where T: BinaryInteger {
        self.storage = Int64(source)
    }

    public init<T>(truncatingIfNeeded source: T) where T: BinaryInteger {
        self.storage = Int64(truncatingIfNeeded: source)
    }

    public init<T>(clamping source: T) where T: BinaryInteger {
        self.storage = Int64(clamping: source)
    }

    public var words: Int64.Words {
        return self.storage.words
    }

    public var trailingZeroBitCount: Int {
        return self.storage.trailingZeroBitCount
    }

    public static func / (lhs: TDInt64, rhs: TDInt64) -> TDInt64 {
        return TDInt64(rhs.storage / rhs.storage)
    }

    public static func /= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage /= rhs.storage
    }

    public static func % (lhs: TDInt64, rhs: TDInt64) -> TDInt64 {
        return TDInt64(lhs.storage % rhs.storage)
    }

    public static func %= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage %= rhs.storage
    }

    public static func * (lhs: TDInt64, rhs: TDInt64) -> TDInt64 {
        return TDInt64(lhs.storage * rhs.storage)
    }

    public static func *= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage *= rhs.storage
    }

    public static func &= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage &= rhs.storage
    }

    public static func |= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage |= rhs.storage
    }

    public static func ^= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage ^= rhs.storage
    }

    public init?<T>(exactly source: T) where T: BinaryInteger {
        guard let storage = Int64(exactly: source) else {
            return nil
        }
        self.storage = storage
    }

    public var magnitude: Int64.Magnitude {
        return self.storage.magnitude
    }

    public init(integerLiteral value: Int64.IntegerLiteralType) {
        self.storage = Int64(integerLiteral: value)
    }

    public static func <<= <RHS>(lhs: inout TDInt64, rhs: RHS) where RHS:  BinaryInteger {
        return lhs.storage <<= rhs
    }

    public static func >>= <RHS>(lhs: inout TDInt64, rhs: RHS) where RHS: BinaryInteger {
        return lhs.storage >>= rhs
    }

    public static prefix func ~ (x: TDInt64) -> TDInt64 {
        return TDInt64(~x.storage)
    }

    public static func -= (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage -= rhs.storage
    }

    public static func - (lhs: TDInt64, rhs: TDInt64) -> TDInt64 {
        return TDInt64(lhs.storage - rhs.storage)
    }

    public static func += (lhs: inout TDInt64, rhs: TDInt64) {
        lhs.storage += rhs.storage
    }

    public var bitWidth: Int {
        return self.storage.bitWidth
    }

    public static func + (lhs: TDInt64, rhs: TDInt64) -> TDInt64 {
        return TDInt64(lhs.storage + rhs.storage)
    }

}
