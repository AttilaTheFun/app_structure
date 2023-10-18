import ApplicationFoundation
import ApplicationLifeCycleServiceInterface
import ExampleAuthenticationServiceInterface
import ExampleSignInFeatureInterface
import SceneLifeCycleServiceInterface
import SceneRouteServiceInterface

extension ExampleApplicationScope: ApplicationLifeCycleListenerProvider {}
extension ExampleApplicationScope: ApplicationLifeCycleServiceProvider {}
extension ExampleApplicationScope: ExampleAuthenticationServiceProvider {}
extension ExampleApplicationScope: SceneRouteServiceProvider {}
extension ExampleApplicationScope: SharedSceneLifeCycleServiceProvider {}

extension ExampleApplicationScope: ExampleSignInCompleterProvider {
    public var exampleSignInCompleter: ExampleSignInCompleter {
        return self
    }
}