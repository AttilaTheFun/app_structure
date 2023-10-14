import Combine
import DependencyFoundation

/**
 RootScope holds dependencies whose lifespan is the intersection of application states and scene lifespans.
 E.g. if the user logged out or closed the window the RootScope instance would be released.
 It is built by the ApplicationScope and usually passes through some of its provided dependencies.
 It builds RootViewController instances for Windows.
 */
public typealias RootScope
    = DependencyProvider
    & RootViewControllerBuilder

public protocol RootScopeProvider: AnyObject {
    /// The current RootScope instance.
    var rootScope: RootScope { get }

    /// A publisher for the above instance.
    var rootScopePublisher: AnyPublisher<RootScope, Never> { get }
}
