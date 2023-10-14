import Combine
import Foundation

public protocol RootScopeBuilder {
    /**
     Build a new RootScope instance for the given SceneScope.
     */
    func buildRootScope(sceneScope: SceneScope) -> RootScope
}

public protocol RootScopeBuilderProvider {
    /// The current RootScopeBuilder instance.
    var rootScopeBuilder: RootScopeBuilder { get }

    /// A publisher for the current StateScope instance.
    var rootScopeBuilderPublisher: AnyPublisher<RootScopeBuilder, Never> { get }
}
