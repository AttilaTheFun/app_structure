import Combine
import UIKit

/**
 This service is is used to determine the highest activation state among registered scene life cycle service instances.
 */
public protocol SharedSceneLifeCycleService: AnyObject {
    // MARK: Scene Activation State

    /// The highest activation state of any scene life cycle service registered with the router.
    var activationState: UIScene.ActivationState { get }

    /// A publisher for the above state.
    var activationStatePublisher: AnyPublisher<UIScene.ActivationState, Never> { get }

    // MARK: Services

    /**
     Adds a scene life cycle service to monitor.
     */
    func add(service: SceneLifeCycleService)

    /**
     Removes a scene life cycle service from being monitored.
     */
    func remove(service: SceneLifeCycleService)
}

public protocol SharedSceneLifeCycleServiceProvider {
    var sharedSceneLifeCycleService: SharedSceneLifeCycleService { get }
}
