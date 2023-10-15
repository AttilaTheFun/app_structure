import AuthenticationServiceInterface
import BuildConfigurationServiceInterface
import ClientConfigurationServiceInterface
import DependencyFoundation
import RequestsServiceInterface
import SessionsServiceInterface
import SnagScopeFeatureInterface

// MARK: ExampleSignedOutStateScopeDependencies

public typealias ExampleSignedOutStateScopeDependencies
    = AuthenticationServiceProvider
    & BuildConfigurationServiceProvider
    & ClientConfigurationServiceProvider
    & SessionsServiceProvider
    & SignInCompleterProvider
    & UnauthenticatedRequestsServiceProvider

// MARK: ExampleSignedOutStateScopeBuilder

public final class ExampleSignedOutStateScopeBuilder: DependencyContainer<ExampleSignedOutStateScopeDependencies> {}

public extension ExampleSignedOutStateScopeBuilder {
    func build() -> ExampleSignedOutStateScope {
        ExampleSignedOutStateScope(dependencies: dependencies)
    }
}
