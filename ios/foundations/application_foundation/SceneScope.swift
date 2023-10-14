import DependencyFoundation
import UIKit

/**
 SceneScope holds dependencies with the same lifespan as the associated UISceneDelegate.
 It is built by the ApplicationScope and usually passes through some of its provided dependencies.
 It is passed to the RootScopeBuilder to build RootScope instances and it exposes a SceneLifeCycleListener.
 */
public typealias SceneScope
    = DependencyProvider
    & SceneLifeCycleListenerProvider
