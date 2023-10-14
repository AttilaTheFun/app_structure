import Combine
import UIKit

public protocol RootViewControllerBuilder {
    /**
     Build a new RootViewController instance to associate with a UIScene's UIWindow.
     */
    func buildRootViewController() -> UIViewController
}
