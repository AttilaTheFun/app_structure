import RouteFoundation
import UIKit

public protocol RouteService: AnyObject {
    func destination(of route: some Route) -> UIViewController
}

public protocol RouteServiceProvider {
    var routeService: RouteService { get }
}

public protocol WeakRouteServiceProvider {
    var routeService: RouteService? { get }
}
