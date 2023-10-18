import ExampleAuthenticationServiceInterface
// import RequestsServiceInterface
import ExampleSignInFeatureInterface

extension ExampleSignedOutRootScope: ExampleAuthenticationServiceProvider {
    public var exampleAuthenticationService: ExampleAuthenticationService {
        dependencies.exampleAuthenticationService
    }
}

extension ExampleSignedOutRootScope: ExampleSignInCompleterProvider {
    public var exampleSignInCompleter: ExampleSignInCompleter {
        dependencies.exampleSignInCompleter
    }
}

// extension ExampleSignedOutRootScope: UnauthenticatedRequestsServiceProvider {
//     public var unauthenticatedRequestsService: UnauthenticatedRequestsService {
//         dependencies.unauthenticatedRequestsService
//     }
// }