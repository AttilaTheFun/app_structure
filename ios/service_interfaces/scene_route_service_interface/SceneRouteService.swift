import Combine
import SceneLifeCycleServiceInterface
import UIKit

/**
 With multiple active scenes each with their own windows and scoped dependencies, 
 sometimes we need to either get all of a dependency from the services,
 or pick one instance to handle something.

 This service allows scene scopes to advertise their dependencies upwards to shared / application level scopes.
 */
public protocol SceneRouteService: AnyObject {
    // MARK: Getting & Setting Values

    /// Get all of the values (if any) for the given type that have been set across all scenes.
    func getAll<T>() -> [T]

    /// Select one of the values (if any) for the given type that was set. Prefer: most recently foreground active,
    /// foreground inactive, background, unattached.
    func get<T>() -> T?

    /// Set the given value for the given scene lifecycle service.
    func set<T>(implementation: AnyObject, interface: T.Type, sceneLifeCycleService: SceneLifeCycleService)

    /// Remove the values for the given scene lifecycle service.
    func removeValues(sceneLifeCycleService: SceneLifeCycleService)
}

public protocol SceneRouteServiceProvider {
    var sceneRouteService: SceneRouteService { get }
}
