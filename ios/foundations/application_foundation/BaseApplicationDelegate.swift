import DependencyFoundation
import UIKit

/**
 A base UIApplicationDelegate class which per-app subclasses can inherit from.
 Subclasses must have the @main attribute and override the scope variable to provide their respective application scope.
 E.g.:
 ```
 @main
 final class ApplicationDelegate: BaseApplicationDelegate {
    private let myApplicationScope = MyApplicationScope(dependencies: ())

    override var applicationScope: ApplicationScope {
        return self.myApplicationScope
    }
 }
 ```
 */
open class BaseApplicationDelegate: UIResponder {
    // MARK: Properties

    open var applicationScope: ApplicationScope {
        fatalError("application scope has not been implemented")
    }
}

// MARK: BaseApplicationDelegate + UIApplicationDelegate

extension BaseApplicationDelegate: UIApplicationDelegate {
    // MARK: Initialization

    open func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    )
        -> Bool {
        self.applicationScope.applicationLifeCycleListener.application(
            application,
            willFinishLaunchingWithOptions: launchOptions
        )
    }

    open func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool {
        self.applicationScope.applicationLifeCycleListener.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }

    // MARK: Application Life Cycle

    public func applicationWillTerminate(_ application: UIApplication) {
        self.applicationScope.applicationLifeCycleListener.applicationWillTerminate(application)
    }

    // MARK: Notifications

    open func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        self.applicationScope.applicationLifeCycleListener.application(
            application,
            didRegisterForRemoteNotificationsWithDeviceToken: deviceToken
        )
    }

    open func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        self.applicationScope.applicationLifeCycleListener.application(
            application,
            didFailToRegisterForRemoteNotificationsWithError: error
        )
    }

    // MARK: Background URL Sessions

    open func application(
        _ application: UIApplication,
        handleEventsForBackgroundURLSession identifier: String,
        completionHandler: @escaping () -> Void
    ) {
        self.applicationScope.applicationLifeCycleListener.application(
            application,
            handleEventsForBackgroundURLSession: identifier,
            completionHandler: completionHandler
        )
    }
}
