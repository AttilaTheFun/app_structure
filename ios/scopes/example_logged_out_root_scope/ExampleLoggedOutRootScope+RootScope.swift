import ApplicationFoundation
import UIKit

// extension ExampleLoggedOutRootScope: RootScope {}

extension ExampleLoggedOutRootScope: RootViewControllerBuilder {
    public func buildRootViewController() -> UIViewController {
        signInBuilder.build()
    }
}
