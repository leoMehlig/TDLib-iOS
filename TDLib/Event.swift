public protocol Event {
    static var inital: Self { get }
}

public protocol PromiseEvent: Event {
    var isPending: Bool { get }
}

extension Optional: Event {
    public static var inital: Optional { return nil }
}

extension Array: Event {
    public static var inital: [Element] { return [] }
}

public enum LoadingFailableEvent<V>: Event, PromiseEvent {
    case pending
    case value(V)
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
    public static var inital: LoadingEvent<V> { return .pending }
    
    case pending
    case value(V)
    
    public var value: V? {
        switch self {
        case .pending:
            return nil
        case let .value(value):
            return value
        }
    }
}

public enum DownloadEvent<V>: PromiseEvent {
    public var isPending: Bool {
        switch self {
        case .loading:
            return true
        case .completed, .failled:
            return false
        }
    }
    
    public static var inital: DownloadEvent<V> { return .loading(nil) }
    
    case loading(V?)
    case completed(V)
    case failled(V?)
}
