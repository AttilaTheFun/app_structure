import Combine
import UIKit

/**
 A base UISceneDelegate class which per-app subclasses can inherit from.
 E.g.
 ```
 final class SceneDelegate: BaseSceneDelegate {}
 ```
 */
open class BaseSceneDelegate: UIResponder {
    // MARK: Properties

    public var window: UIWindow?

    private let sceneScope: SceneScope
    private let rootScopeSubject: CurrentValueSubject<RootScope, Never>
    private var cancellables = Set<AnyCancellable>()

    // MARK: Initialization

    override init() {
        // Create the scene scope:
        let applicationDelegate = UIApplication.shared.delegate as! BaseApplicationDelegate
        let applicationScope = applicationDelegate.applicationScope
        let sceneScope = applicationScope.sceneScopeBuilder.buildSceneScope()
        self.sceneScope = sceneScope

        // Create the root scope subject with its initial value:
        let rootScope = applicationScope.rootScopeBuilder.buildRootScope(sceneScope: self.sceneScope)
        self.rootScopeSubject = CurrentValueSubject(rootScope)

        super.init()

        // Observe changes to the current scope:
        applicationScope.rootScopeBuilderPublisher
            .dropFirst(1)
            .receive(on: DispatchQueue.main)
            .compactMap { rootScopeBuilder in
                return rootScopeBuilder.buildRootScope(sceneScope: sceneScope)
            }
            .assign(to: \.value, on: self.rootScopeSubject)
            .store(in: &self.cancellables)
    }
}

// MARK: BaseSceneDelegate + RootScopeProvider

extension BaseSceneDelegate: RootScopeProvider {
    public var rootScope: RootScope {
        self.rootScopeSubject.value
    }

    public var rootScopePublisher: AnyPublisher<RootScope, Never> {
        self.rootScopeSubject.eraseToAnyPublisher()
    }
}

// MARK: BaseSceneDelegate + UIWindowSceneDelegate

extension BaseSceneDelegate: UIWindowSceneDelegate {
    // MARK: Scene Life Cycle

    public func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Setup the window:
        let window = Window(
            windowScene: windowScene,
            rootScopeProvider: self
        )
        window.windowScene = windowScene
        window.makeKeyAndVisible()
        self.window = window

        // Notify the scene life cycle service:
        self.sceneScope.sceneLifeCycleListener.scene(scene, willConnectTo: session, options: connectionOptions)

        // If there was a user activity, attempt to continue it or open the url contexts:
        if let userActivity = connectionOptions.userActivities.first {
            self.scene(scene, continue: userActivity)
        } else if connectionOptions.urlContexts.count > 0 {
            self.scene(scene, openURLContexts: connectionOptions.urlContexts)
        }
    }

    public func sceneDidDisconnect(_ scene: UIScene) {
        self.sceneScope.sceneLifeCycleListener.sceneDidDisconnect(scene)
    }

    public func sceneDidBecomeActive(_ scene: UIScene) {
        self.sceneScope.sceneLifeCycleListener.sceneDidBecomeActive(scene)
    }

    public func sceneWillResignActive(_ scene: UIScene) {
        self.sceneScope.sceneLifeCycleListener.sceneWillResignActive(scene)
    }

    public func sceneWillEnterForeground(_ scene: UIScene) {
        self.sceneScope.sceneLifeCycleListener.sceneWillEnterForeground(scene)
    }

    public func sceneDidEnterBackground(_ scene: UIScene) {
        self.sceneScope.sceneLifeCycleListener.sceneDidEnterBackground(scene)
    }

    // MARK: Activities

    public func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        self.sceneScope.sceneLifeCycleListener.scene(scene, continue: userActivity)
    }

    // MARK: URL Contexts

    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        self.sceneScope.sceneLifeCycleListener.scene(scene, openURLContexts: URLContexts)
    }
}
