import ApplicationLifeCycleServiceInterface
import Combine
import UIKit

public final class ApplicationLifeCycleServiceImplementation {
    // MARK: Properties

    private var plugins = [ObjectIdentifier: ApplicationLifeCyclePlugin]()

    // MARK: Initialization

    public init() {}

    // MARK: Private

    private func forEachPlugin(closure: (ApplicationLifeCyclePlugin) -> Void) {
        for plugin in self.plugins.values {
            closure(plugin)
        }
    }
}

// MARK: ApplicationLifeCycleServiceImplementation + ApplicationLifeCycleService

extension ApplicationLifeCycleServiceImplementation: ApplicationLifeCycleService {
    public func add(plugin: ApplicationLifeCyclePlugin) {
        self.plugins[ObjectIdentifier(plugin)] = plugin
    }

    public func remove(plugin: ApplicationLifeCyclePlugin) {
        self.plugins[ObjectIdentifier(plugin)] = nil
    }
}

// MARK: ApplicationLifeCycleServiceImplementation + ApplicationLifeCyclePlugin

extension ApplicationLifeCycleServiceImplementation: ApplicationLifeCyclePlugin {
    // MARK: Initialization

    public func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.forEachPlugin { plugin in
            _ = plugin.application(application, willFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.forEachPlugin { plugin in
            _ = plugin.application(application, didFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }

    // MARK: Application Life Cycle

    public func applicationWillTerminate(_ application: UIApplication) {
        self.forEachPlugin { plugin in
            _ = plugin.applicationWillTerminate(application)
        }
    }

    // MARK: Notifications

    public func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        self.forEachPlugin { plugin in
            plugin.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }

    public func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        self.forEachPlugin { plugin in
            plugin.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }

    // MARK: Background URL Sessions

    public func application(
        _ application: UIApplication,
        handleEventsForBackgroundURLSession identifier: String,
        completionHandler: @escaping () -> Void
    ) {
        self.forEachPlugin { plugin in
            plugin.application(
                application,
                handleEventsForBackgroundURLSession: identifier,
                completionHandler: completionHandler
            )
        }
    }
}
