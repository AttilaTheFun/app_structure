import ApplicationFoundation
import ExampleAuthenticationServiceInterface
import DependencyFoundation
import Foundation
// import RequestsServiceInterface
import ExampleSignInFeatureInterface

// MARK: ExampleSignedOutRootScopeDependencies

public typealias ExampleSignedOutRootScopeDependencies
    = DependencyProvider
    & ExampleAuthenticationServiceProvider
    & ExampleSignInCompleterProvider
    // & UnauthenticatedRequestsServiceProvider

// MARK: ExampleSignedOutRootScopeBuilder

public final class ExampleSignedOutRootScopeBuilder: DependencyContainer<ExampleSignedOutRootScopeDependencies> {}

// MARK: ExampleSignedOutRootScopeBuilder + RootScopeBuilder

extension ExampleSignedOutRootScopeBuilder: RootScopeBuilder {
    public func buildRootScope(sceneScope _: SceneScope) -> RootScope {
        ExampleSignedOutRootScope(dependencies: dependencies)
    }
}
