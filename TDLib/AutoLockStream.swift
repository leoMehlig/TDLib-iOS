public protocol MergableEvent: Event {
    func merge(with new: Self) -> Self
}

public class AutoLockStream<E: MergableEvent>: Stream<E> {
    private var isLocked: Bool = false

    public func unlock(after delay: DispatchTime = .now()) {
        self.subscribersQueue.asyncAfter(deadline: delay) {
            self.isLocked = false
            if self.merged != nil {
                self.notifySubscribers(with: self.current)
            }
        }
    }

    public private(set) var notified: E = .inital
    private var merged: E?
    
    override func notifySubscribers(with current: E) {
        if self.isLocked {
            self.merged = self.merged?.merge(with: current) ?? current
        } else {
            self.isLocked = true
            self.notified = self.merged ?? current
            super.notifySubscribers(with: self.merged ?? current)
            self.merged = nil
        }

    }
}
