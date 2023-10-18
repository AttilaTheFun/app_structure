import ApplicationFoundation
import ApplicationLifeCycleServiceInterface
import ExampleAuthenticationServiceInterface
import ExampleSignInFeatureInterface

extension ExampleApplicationScope: ApplicationLifeCycleListenerProvider {}
extension ExampleApplicationScope: ApplicationLifeCycleServiceProvider {}
extension ExampleApplicationScope: ExampleAuthenticationServiceProvider {}

extension ExampleApplicationScope: ExampleSignInCompleterProvider {
    public var exampleSignInCompleter: ExampleSignInCompleter {
        return self
    }
}