import ApplicationFoundation
import UIKit

public typealias SceneLifeCyclePlugin = SceneLifeCycleListener

public extension SceneLifeCyclePlugin {
    // MARK: Connecting and Disconnecting Scenes

    func scene(
        _: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {}

    func sceneDidDisconnect(_: UIScene) {}

    // MARK: Transitioning to the Foreground

    func sceneWillEnterForeground(_: UIScene) {}

    func sceneDidBecomeActive(_: UIScene) {}

    // MARK: Transitioning to the Background

    func sceneWillResignActive(_: UIScene) {}

    func sceneDidEnterBackground(_: UIScene) {}

    // MARK: Opening URLs

    func scene(_: UIScene, openURLContexts _: Set<UIOpenURLContext>) {}

    // MARK: Continuing User Activities

    func scene(_: UIScene, willContinueUserActivityWithType _: String) {}

    func scene(_: UIScene, continue _: NSUserActivity) {}

    func scene(_: UIScene, didFailToContinueUserActivityWithType _: String, error _: Error) {}

    // MARK: Saving the State of the Scene

    func stateRestorationActivity(for _: UIScene) -> NSUserActivity? { nil }

    func scene(_: UIScene, didUpdate _: NSUserActivity) {}
}
