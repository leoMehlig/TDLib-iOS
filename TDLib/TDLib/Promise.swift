public class Promise<T>: Stream<LoadingFailableEvent<T>> {
    override public var current: LoadingFailableEvent<T> {
        willSet {
            if !self.current.isPending {
                fatalError("Updating value on completed promise!!!")
            }
        }
        didSet {
            super.current = self.current
            if !self.current.isPending {
                self.unsubscribeAll()
            }
        }
    }
    
    public override func subscribe(with token: AnyHashable? = nil, on queue: DispatchQueue? = nil, with callback: @escaping (LoadingFailableEvent<T>) -> Void) {
        if self.current.isPending {
            super.subscribe(with: token, on: queue, with: callback)
        } else if let queue = queue {
            queue.async {
                callback(self.current)
            }
        } else {
            callback(self.current)
        }
    }
    
    public func map<R>(_ block: @escaping (T) throws -> R) -> Promise<R> {
        let mappedPromise = Promise<R>()
        self.subscribeStrong(mappedPromise) { (promise, event) in
            switch event {
            case .pending:
                promise.current = .pending
            case let .value(value):
                do {
                    promise.current = .value(try block(value))
                } catch {
                    promise.current = .error(error)
                }
            case let .error(error):
                promise.current = .error(error)
            }
        }
        return mappedPromise
    }
    
    public func then<R>(_ block: @escaping (T) -> Promise<R>) -> Promise<R> {
        let mappedPromise = Promise<R>()
        self.subscribeStrong(mappedPromise) { (promise, event) in
            switch event {
            case .pending:
                promise.current = .pending
            case let .value(value):
                let next = block(value)
                next.subscribeStrong(promise) { promise, event in
                    promise.current = event
                }
            case let .error(error):
                promise.current = .error(error)
            }
        }
        return mappedPromise
    }
    
    public func `catch`(_ block: @escaping (Error) -> Void) -> Promise<T> {
        self.subscribe { event in
            if case let .error(error) = event {
                block(error)
            }
        }
        return self
    }
}
