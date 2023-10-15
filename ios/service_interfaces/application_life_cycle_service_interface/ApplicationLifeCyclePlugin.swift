import ApplicationFoundation
import UIKit

/**
 ApplicationLifeCyclePlugins listen to one or more events around the application lifecycle.
 */
public typealias ApplicationLifeCyclePlugin = ApplicationLifeCycleListener

public extension ApplicationLifeCyclePlugin {
    // MARK: Initialization

    func application(
        _: UIApplication,
        willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool {
        true
    }

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool {
        true
    }

    // MARK: Application Life Cycle

    func applicationWillTerminate(_: UIApplication) {}

    // MARK: Notifications

    func application(
        _: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken _: Data
    ) {}

    func application(
        _: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError _: Error
    ) {}

    // MARK: Background URL Sessions

    func application(
        _: UIApplication,
        handleEventsForBackgroundURLSession _: String,
        completionHandler _: @escaping () -> Void
    ) {}
}
