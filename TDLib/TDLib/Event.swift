public protocol Event {
    associatedtype T
    static var inital: Self { get }
}

public protocol PromiseEvent: Event {
    var isPending: Bool { get }
}

public enum LoadingFailableEvent<V>: Event, PromiseEvent {
    public typealias T = V
    case pending
    case value(T)
    case error(Error)
    public static var inital: LoadingFailableEvent<V> { return .pending }
    public var isPending: Bool {
        switch self {
        case .pending:
            return true
        case .value, .error:
            return false
        }
    }
}

public enum LoadingEvent<V>: Event {
    public typealias T = V
    public static var inital: LoadingEvent<V> { return .pending }
    
    case pending
    case value(T)
    
    public var value: T? {
        switch self {
        case .pending:
            return nil
        case let .value(value):
            return value
        }
    }
}
