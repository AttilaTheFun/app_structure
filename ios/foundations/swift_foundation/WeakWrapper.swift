public struct WeakWrapper<Object> where Object: AnyObject {
    public private(set) weak var object: Object?

    public init(object: Object) {
        self.object = object
    }
}

public struct AnyWeakWrapper {
    public private(set) weak var object: AnyObject?

    public init(object: AnyObject) {
        self.object = object
    }
}
