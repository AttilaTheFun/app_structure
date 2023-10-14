import RouteFoundation

public protocol MutableRouteService: RouteService {
    func register<HandledRoute>(factory: @escaping RouteHandlerFactory<HandledRoute>)
}

public protocol MutableRouteServiceProvider {
    var mutableRouteService: MutableRouteService { get }
}
