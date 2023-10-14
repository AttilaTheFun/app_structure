import UIKit

/**
 An object that listens to one or more events from the application lifecycle.
 */
public protocol ApplicationLifeCycleListener: AnyObject {
    // MARK: Initialization

    /**
     Tells the delegate that the launch process has begun but that state restoration hasn’t occured.
     */
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool

    /**
     Tells the delegate that the launch process is almost done and the app is almost ready to run.
     */
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool

    // MARK: Application Life Cycle

    /**
     When using scenes, UIKit will not call the following methods:
     - applicationDidBecomeActive(_:)
     - applicationWillResignActive(_:)
     - applicationDidEnterBackground(_:)
     - applicationWillEnterForeground(_:)

     Instead, UIKit will call the following scene delegate methods:
     - sceneDidBecomeActive(_:)
     - sceneWillResignActive(_:)
     - sceneDidEnterBackground(_:)
     - sceneWillEnterForeground(_:)
     */

    /**
     Tells the delegate when the app is about to terminate.
     */
    func applicationWillTerminate(_ application: UIApplication)

    // MARK: Notifications

    /**
     Tells the delegate that the app successfully registered with Apple Push Notification service (APNs).
     */
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)

    /**
     Sent to the delegate when Apple Push Notification service cannot successfully complete the registration process.
     */
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)

    // MARK: Background URL Sessions

    func application(
        _ application: UIApplication,
        handleEventsForBackgroundURLSession identifier: String,
        completionHandler: @escaping () -> Void
    )
}

public protocol ApplicationLifeCycleListenerProvider {
    var applicationLifeCycleListener: ApplicationLifeCycleListener { get }
}
