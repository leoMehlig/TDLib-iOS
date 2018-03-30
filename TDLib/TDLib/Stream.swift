public class Stream<E: Event> {
    public struct Subscriber<E: Event> {
        let queue: DispatchQueue?
        let token: AnyHashable?
        let callback: (E) -> Void
        
        init(queue: DispatchQueue? = nil, token: AnyHashable? = nil, _ callback: @escaping (E) -> Void) {
            self.queue = queue
            self.token = token
            self.callback = callback
        }
    }
    
    var subscribers: [Subscriber<E>] = []
    
    public init() { }
    public var current: E = E.inital {
        didSet {
            self.notifySubscribers(with: self.current)
        }
    }
    
    func notifySubscribers(with current: E) {
        self.subscribers.forEach({ subscriber in
            if let queue = subscriber.queue {
                queue.async {
                    subscriber.callback(current)
                }
            } else {
                subscriber.callback(current)
            }
        })
    }
    
    public func subscribe(with token: AnyHashable? = nil, on queue: DispatchQueue? = nil, with callback: @escaping (E) -> Void) {
        self.subscribers.append(Subscriber(queue: queue, token: token, callback))
        if let queue = queue {
            queue.async {
                callback(self.current)
            }
        } else {
            callback(self.current)
        }
    }
    
    public func subscribeStrong<S: AnyObject>(_ sender: S, with token: AnyHashable? = nil, on queue: DispatchQueue? = nil, with callback: @escaping (S, E) -> Void) {
        self.subscribe(with: token, on: queue) { [weak sender] event in
            if let strongSender = sender {
                callback(strongSender, event)
            }
        }
    }
    @discardableResult
    public func unsubscribe(_ token: AnyHashable) -> Bool {
        if let (index, _) = self.subscribers.enumerated().first(where: { $1.token == token }) {
            self.subscribers.remove(at: index)
            return true
        }
        return false
    }
    
    public func unsubscribeAll() {
        self.subscribers.removeAll()
    }
}
