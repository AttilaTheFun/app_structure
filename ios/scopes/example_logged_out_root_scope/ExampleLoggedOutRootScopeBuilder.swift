import ApplicationFoundation
import AuthenticationServiceInterface
import BuildConfigurationServiceInterface
import ClientConfigurationServiceInterface
import DependencyFoundation
import Foundation
import RequestsServiceInterface
import SignInFeatureInterface
import SnagScopeFeatureInterface

// MARK: ExampleLoggedOutRootScopeDependencies

public typealias ExampleLoggedOutRootScopeDependencies
    = AuthenticationServiceProvider
    & BuildConfigurationServiceProvider
    & ClientConfigurationServiceProvider
    & SignInCompleterProvider
    & UnauthenticatedRequestsServiceProvider

// MARK: ExampleLoggedOutRootScopeBuilder

public final class ExampleLoggedOutRootScopeBuilder: DependencyContainer<ExampleLoggedOutRootScopeDependencies> {}

// MARK: ExampleLoggedOutRootScopeBuilder + RootScopeBuilder

extension ExampleLoggedOutRootScopeBuilder: RootScopeBuilder {
    public func buildRootScope(sceneScope _: SceneScope) -> RootScope {
        ExampleLoggedOutRootScope(dependencies: dependencies)
    }
}
