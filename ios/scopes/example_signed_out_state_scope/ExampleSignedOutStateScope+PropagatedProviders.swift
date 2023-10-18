import ExampleAuthenticationServiceInterface
// import RequestsServiceInterface
import ExampleSignInFeatureInterface

// MARK: App Providers

extension ExampleSignedOutStateScope: ExampleAuthenticationServiceProvider {
    public var exampleAuthenticationService: ExampleAuthenticationService {
        dependencies.exampleAuthenticationService
    }
}

// extension ExampleSignedOutStateScope: UnauthenticatedRequestsServiceProvider {
//     public var unauthenticatedRequestsService: UnauthenticatedRequestsService {
//         dependencies.unauthenticatedRequestsService
//     }
// }

extension ExampleSignedOutStateScope: ExampleSignInCompleterProvider {
    public var exampleSignInCompleter: ExampleSignInCompleter {
        dependencies.exampleSignInCompleter
    }
}
