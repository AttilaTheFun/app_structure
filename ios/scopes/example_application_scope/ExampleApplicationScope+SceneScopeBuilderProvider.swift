import ApplicationFoundation
import ExampleSceneScope

extension ExampleApplicationScope: SceneScopeBuilderProvider {
    public var sceneScopeBuilder: SceneScopeBuilder {
        ExampleSceneScopeBuilder(dependencies: self)
    }
}
