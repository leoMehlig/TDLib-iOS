public class Stream<E: Event> {
    public struct Subscriber<E: Event> {
        let queue: DispatchQueue
        let token: AnyHashable?
        let callback: (E) -> Void
        
        init(queue: DispatchQueue = .global(), token: AnyHashable? = nil, _ callback: @escaping (E) -> Void) {
            self.queue = queue
            self.token = token
            self.callback = callback
        }
    }
    
    let subscribersQueue = DispatchQueue(label: "stream_subscribers_queue", attributes: .concurrent)
    
    var subscribers: [Subscriber<E>] = []
    
    public init() { }
    public var current: E = E.inital {
        didSet {
            self.notifySubscribers(with: self.current)
        }
    }
    
    func notifySubscribers(with current: E) {
        self.subscribersQueue.sync {
            self.subscribers.forEach({ subscriber in
                subscriber.queue.async {
                    subscriber.callback(current)
                }
            })
        }
    }
    
    public func subscribe(with token: AnyHashable? = nil, on queue: DispatchQueue = .global(), with callback: @escaping (E) -> Void) {
        queue.async {
            callback(self.current)
        }
        self.subscribersQueue.async(flags: .barrier) {
            self.subscribers.append(Subscriber(queue: queue, token: token, callback))
        }
    }
    
    public func subscribeStrong<S: AnyObject>(_ sender: S,
                                              with token: AnyHashable? = nil,
                                              on queue: DispatchQueue = .global(),
                                              with callback: @escaping (S, E) -> Void) {
        self.subscribe(with: token, on: queue) { [weak sender] event in
            if let strongSender = sender {
                callback(strongSender, event)
            }
        }
    }

    public func unsubscribe(_ token: AnyHashable) {
        self.subscribersQueue.async(flags: .barrier) {
            if let (index, _) = self.subscribers.enumerated().first(where: { $1.token == token }) {
                self.subscribers.remove(at: index)
            }
        }
    }
    
    public func unsubscribeAll() {
        self.subscribersQueue.async(flags: .barrier) {
            self.subscribers.removeAll()
        }
    }
}
