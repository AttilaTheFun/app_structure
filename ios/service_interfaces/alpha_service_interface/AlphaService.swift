
public protocol FooService {
    func foo()   
}

public protocol FooServiceProvider {
    var fooService: FooService { get }
}