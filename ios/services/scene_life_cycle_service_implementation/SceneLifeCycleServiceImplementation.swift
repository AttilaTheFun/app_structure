import Combine
import KeyFoundation
import SceneLifeCycleServiceInterface
import SwiftFoundation
import UIKit

public final class SceneLifeCycleServiceImplementation {
    // MARK: Properties

    private let activationStateSubject: CurrentValueSubject<UIScene.ActivationState, Never>
    private var plugins = [ObjectIdentifier: AnyWeakWrapper]()

    // MARK: Injected Dependencies

    private let sharedSceneLifeCycleService: SharedSceneLifeCycleService

    // MARK: Initialization

    public init(
        sharedSceneLifeCycleService: SharedSceneLifeCycleService
    ) {
        // Save the injected dependencies:
        self.sharedSceneLifeCycleService = sharedSceneLifeCycleService
        self.activationStateSubject = CurrentValueSubject(.unattached)

        // Add the receiver to the shared scene life cycle service:
        self.sharedSceneLifeCycleService.add(service: self)
    }

    deinit {
        // Remove the receiver from the shared scene life cycle service:
        self.sharedSceneLifeCycleService.remove(service: self)
    }

    // MARK: Private

    private func forEachPlugin(closure: (SceneLifeCyclePlugin) -> Void) {
        for (_, pluginWrapper) in self.plugins {
            guard let plugin = pluginWrapper.object as? SceneLifeCyclePlugin
            else {
                continue
            }

            closure(plugin)
        }
    }
}

// MARK: Namespace + SceneLifeCycleServiceImplementation

private extension Namespace {
    static var namespace: Namespace {
        Namespace(type: SceneLifeCycleServiceImplementation.self)
    }
}

// MARK: SceneLifeCycleServiceImplementation + SceneLifeCycleService

extension SceneLifeCycleServiceImplementation: SceneLifeCycleService {
    // MARK: State

    public var activationState: UIScene.ActivationState {
        self.activationStateSubject.value
    }

    public var activationStatePublisher: AnyPublisher<UIScene.ActivationState, Never> {
        self.activationStateSubject.eraseToAnyPublisher()
    }

    // MARK: Plugins

    public func add(plugin: SceneLifeCyclePlugin) {
        self.plugins[ObjectIdentifier(plugin)] = AnyWeakWrapper(object: plugin)
    }

    public func remove(plugin: SceneLifeCyclePlugin) {
        self.plugins[ObjectIdentifier(plugin)] = nil
    }
}

// MARK: SceneLifeCycleServiceImplementation + SceneLifeCyclePlugin

extension SceneLifeCycleServiceImplementation: SceneLifeCyclePlugin {
    // MARK: Connecting and Disconnecting Scenes

    public func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.background)
        self.forEachPlugin { plugin in
            plugin.scene(scene, willConnectTo: session, options: connectionOptions)
        }
    }

    public func sceneDidDisconnect(_ scene: UIScene) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.unattached)
        self.forEachPlugin { plugin in
            plugin.sceneDidDisconnect(scene)
        }
    }

    // MARK: Transitioning to the Foreground

    public func sceneWillEnterForeground(_ scene: UIScene) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.foregroundInactive)
        self.forEachPlugin { plugin in
            plugin.sceneWillEnterForeground(scene)
        }
    }

    public func sceneDidBecomeActive(_ scene: UIScene) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.foregroundActive)
        self.forEachPlugin { plugin in
            plugin.sceneDidBecomeActive(scene)
        }
    }

    // MARK: Transitioning to the Background

    public func sceneWillResignActive(_ scene: UIScene) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.foregroundInactive)
        self.forEachPlugin { plugin in
            plugin.sceneWillResignActive(scene)
        }
    }

    public func sceneDidEnterBackground(_ scene: UIScene) {
        // Update the activation state and notify the plugins:
        self.activationStateSubject.send(.background)
        self.forEachPlugin { plugin in
            plugin.sceneDidEnterBackground(scene)
        }
    }

    // MARK: Opening URLs

    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        self.forEachPlugin { plugin in
            plugin.scene(scene, openURLContexts: URLContexts)
        }
    }

    // MARK: Continuing User Activities

    public func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        self.forEachPlugin { plugin in
            plugin.scene(scene, willContinueUserActivityWithType: userActivityType)
        }
    }

    public func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        self.forEachPlugin { plugin in
            plugin.scene(scene, continue: userActivity)
        }
    }

    public func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        self.forEachPlugin { plugin in
            plugin.scene(scene, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }

    // MARK: Saving the State of the Scene

    public func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        for (_, pluginWrapper) in self.plugins {
            guard let plugin = pluginWrapper.object as? SceneLifeCyclePlugin
            else {
                continue
            }

            if let stateRestorationActivity = plugin.stateRestorationActivity(for: scene) {
                return stateRestorationActivity
            }
        }

        return nil
    }

    public func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity) {
        self.forEachPlugin { plugin in
            plugin.scene(scene, didUpdate: userActivity)
        }
    }
}
