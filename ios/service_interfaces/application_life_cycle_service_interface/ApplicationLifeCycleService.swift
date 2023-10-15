import ApplicationFoundation
import Combine
import UIKit

// MARK: ApplicationLifeCycleService

/**
 This service is responsible for relaying events from the application lifecycle to plugins which hook into them.
 */
public protocol ApplicationLifeCycleService: ApplicationLifeCycleListener {
    // MARK: Plugins

    /**
     Adds a plugin to application life cycle events.
     The plugins are retained weakly, and you should call remove(plugin:) when they are released.
     */
    func add(plugin: ApplicationLifeCyclePlugin)

    /**
     Removes a plugin from application life cycle events.
     */
    func remove(plugin: ApplicationLifeCyclePlugin)
}

// MARK: ApplicationLifeCycleServiceProvider

public protocol ApplicationLifeCycleServiceProvider {
    var applicationLifeCycleService: ApplicationLifeCycleService { get }
}

// MARK: ApplicationLifeCycleServiceProvider + ApplicationLifeCycleListenerProvider

public extension ApplicationLifeCycleServiceProvider where Self: ApplicationLifeCycleListenerProvider {
    var applicationLifeCycleListener: ApplicationLifeCycleListener {
        applicationLifeCycleService
    }
}
