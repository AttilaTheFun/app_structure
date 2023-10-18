import ApplicationFoundation
import Combine
import UIKit

// MARK: SceneLifeCycleService

/**
 This service is responsible for relaying events from the scene lifecycle to plugins which hook into them.
 */
public protocol SceneLifeCycleService: SceneLifeCycleListener {
    // MARK: Scene Activation State

    var activationState: UIScene.ActivationState { get }

    var activationStatePublisher: AnyPublisher<UIScene.ActivationState, Never> { get }

    // MARK: Plugins

    /**
     Adds a listener to scene life cycle events.
     The listeners are retained weakly, and you should call remove(listener:) when they are released.
     */
    func add(plugin: SceneLifeCyclePlugin)

    /**
     Removes a listener from scene life cycle events.
     */
    func remove(plugin: SceneLifeCyclePlugin)
}

// MARK: SceneLifeCycleServiceProvider

public protocol SceneLifeCycleServiceProvider {
    var sceneLifeCycleService: SceneLifeCycleService { get }
}

// MARK: SceneLifeCycleServiceProvider + SceneLifeCycleListenerProvider

public extension SceneLifeCycleServiceProvider where Self: SceneLifeCycleListenerProvider {
    var sceneLifeCycleListener: SceneLifeCycleListener {
        sceneLifeCycleService
    }
}
