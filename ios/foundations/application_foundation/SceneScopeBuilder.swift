import Combine
import Foundation

public protocol SceneScopeBuilder {
    /**
     Build a new SceneScope instance to associate with a UISceneDelegate.
     */
    func buildSceneScope() -> SceneScope
}

public protocol SceneScopeBuilderProvider {
    /// The current SceneScopeBuilder instance.
    var sceneScopeBuilder: SceneScopeBuilder { get }
}
