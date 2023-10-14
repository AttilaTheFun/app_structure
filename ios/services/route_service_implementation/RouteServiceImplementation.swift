import RouteFoundation
import RouteServiceInterface
import UIKit

public final class RouteServiceImplementation {
    private var routeHandlerFactories = [String: Any]()

    public init() {}
}

// MARK: RouteServiceImplementation + RouteService

extension RouteServiceImplementation: RouteService {
    private func routeHandler<HandledRoute>(for route: HandledRoute) -> Optional<any RouteHandler<HandledRoute>> {
        let key = String(describing: HandledRoute.self)
        if let routeHandlerFactory = self.routeHandlerFactories[key] as? RouteHandlerFactory<HandledRoute> {
            return routeHandlerFactory()
        }

        return nil
    }

    public func destination(of route: some Route) -> UIViewController {
        guard let handler = self.routeHandler(for: route) else {
            // TODO: Add 404 page instead of fatal error.
            fatalError("Route handler was not registered for route: \(route)")
        }

        return handler.destination(of: route)
    }
}

// MARK: RouteServiceImplementation + MutableRouteService

extension RouteServiceImplementation: MutableRouteService {
    public func register<HandledRoute>(factory: @escaping RouteHandlerFactory<HandledRoute>) {
        let key = String(describing: HandledRoute.self)
        self.routeHandlerFactories[key] = factory
    }
}
