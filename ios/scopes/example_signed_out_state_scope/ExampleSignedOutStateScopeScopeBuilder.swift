import ExampleAuthenticationServiceInterface
import DependencyFoundation
// import RequestsServiceInterface
// import SessionsServiceInterface
import ExampleSignInFeatureInterface

// MARK: ExampleSignedOutStateScopeDependencies

public typealias ExampleSignedOutStateScopeDependencies
    = DependencyProvider
    & ExampleAuthenticationServiceProvider
    // & SessionsServiceProvider
    & ExampleSignInCompleterProvider
    // & UnauthenticatedRequestsServiceProvider

// MARK: ExampleSignedOutStateScopeBuilder

public final class ExampleSignedOutStateScopeBuilder: DependencyContainer<ExampleSignedOutStateScopeDependencies> {}

public extension ExampleSignedOutStateScopeBuilder {
    func build() -> ExampleSignedOutStateScope {
        ExampleSignedOutStateScope(dependencies: dependencies)
    }
}
