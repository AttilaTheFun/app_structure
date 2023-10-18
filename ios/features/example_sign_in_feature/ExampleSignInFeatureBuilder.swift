import DependencyFoundation
import ExampleAuthenticationServiceInterface
import ExampleSignInFeatureInterface
import UIKit

// MARK: ExampleSignInDependencies

public typealias ExampleSignInDependencies
    = ExampleAuthenticationServiceProvider
    & ExampleSignInCompleterProvider

// MARK: ExampleSignInBuilder

public final class ExampleSignInBuilder: DependencyContainer<ExampleSignInDependencies> {}

extension ExampleSignInBuilder {
    public func build() -> UIViewController {
        return ExampleSignInViewController(dependencies: dependencies)
    }
}
