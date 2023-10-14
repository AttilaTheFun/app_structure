import DependencyFoundation
import UIKit

/**
 An ApplicationScope holds dependencies with the same lifespan as the associated UIApplicationDelegate.
 It builds SceneScope instances and provides RootScopeBuilder instances which it replaces when the application state changes.
 It also exposes an ApplicationLifeCycleListener which listens to application lifecycle events.
 */
public typealias ApplicationScope
    = ApplicationLifeCycleListenerProvider
    & DependencyProvider
    & RootScopeBuilderProvider
    & SceneScopeBuilderProvider
