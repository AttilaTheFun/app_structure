import UIKit

public protocol SceneLifeCycleListener: AnyObject {
    // MARK: Connecting and Disconnecting Scenes

    /**
     Tells the delegate about the addition of a scene to the app.
     */
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    )

    /**
     Tells the delegate that UIKit removed a scene from your app.
     */
    func sceneDidDisconnect(_ scene: UIScene)

    // MARK: Transitioning to the Foreground

    /**
     Tells the delegate that the scene is about to begin running in the foreground and become visible to the user.
     */
    func sceneWillEnterForeground(_ scene: UIScene)

    /**
     Tells the delegate that the scene became active and is now responding to user events.
     */
    func sceneDidBecomeActive(_ scene: UIScene)

    // MARK: Transitioning to the Background

    /**
     Tells the delegate that the scene is about to resign the active state and stop responding to user events.
     */
    func sceneWillResignActive(_ scene: UIScene)

    /**
     Tells the delegate that the scene is running in the background and is no longer onscreen.
     */
    func sceneDidEnterBackground(_ scene: UIScene)

    // MARK: Opening URLs

    /**
     Asks the delegate to open one or more URLs.
     */
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>)

    // MARK: Continuing User Activities

    /**
     Tells the delegate that it is about to receive Handoff-related data.
     */
    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String)

    /**
     Tells the delegate to handle the specified Handoff-related activity.
     */
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity)

    /**
     Tells the delegate that the activity could not be continued.
     */
    func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: Error)

    // MARK: Saving the State of the Scene

    /**
     Returns a user activity object encapsulating the current state of the specified scene.
     */
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity?

    /**
     Tells the delegate that the specified activity object was updated.
     */
    func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity)
}

public protocol SceneLifeCycleListenerProvider {
    var sceneLifeCycleListener: SceneLifeCycleListener { get }
}
