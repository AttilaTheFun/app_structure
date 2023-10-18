import ApplicationFoundation
import UIKit

// MARK: ExampleSignedOutRootScope: RootScope

extension ExampleSignedOutRootScope: RootViewControllerBuilder {
    public func buildRootViewController() -> UIViewController {
        exampleSignInBuilder.build()
    }
}
