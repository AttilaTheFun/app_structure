import UIKit

/**
 Handles a route by building and returning the appropriate view controller.
 */
public protocol RouteHandler<HandledRoute> {
    associatedtype HandledRoute: Route
    func destination(of route: HandledRoute) -> UIViewController
}

/**
 A function that produces an instance of a route handler.
 */
public typealias RouteHandlerFactory<HandledRoute> = () -> any RouteHandler<HandledRoute>
