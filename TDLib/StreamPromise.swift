import PromiseKit

public extension Stream {
    func when(_ condition: @escaping (E) -> Bool) -> Guarantee<()> {
        return Guarantee(resolver: { resolver in
            let token = UUID()
            self.subscribe(with: token) {
                if condition($0) {
                    resolver(())
                    self.unsubscribe(token)
                }
            }
        })
    }
}
