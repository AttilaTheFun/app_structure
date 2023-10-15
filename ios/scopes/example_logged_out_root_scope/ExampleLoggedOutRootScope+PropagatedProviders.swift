import AuthenticationServiceInterface
import BuildConfigurationServiceInterface
import ClientConfigurationServiceInterface
import RequestsServiceInterface
import SnagScopeFeatureInterface

extension ExampleLoggedOutRootScope: AuthenticationServiceProvider {
    public var authenticationService: AuthenticationService {
        dependencies.authenticationService
    }
}

extension ExampleLoggedOutRootScope: BuildConfigurationServiceProvider {
    public var buildConfigurationService: BuildConfigurationService {
        dependencies.buildConfigurationService
    }
}

extension ExampleLoggedOutRootScope: ClientConfigurationServiceProvider {
    public var clientConfigurationService: ClientConfigurationService {
        dependencies.clientConfigurationService
    }
}

extension ExampleLoggedOutRootScope: UnauthenticatedRequestsServiceProvider {
    public var unauthenticatedRequestsService: UnauthenticatedRequestsService {
        dependencies.unauthenticatedRequestsService
    }
}

extension ExampleLoggedOutRootScope: SignInCompleterProvider {
    public var signInCompleter: SignInCompleter {
        dependencies.signInCompleter
    }
}
