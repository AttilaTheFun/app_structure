import ApplicationFoundation
import DependencyFoundation
import SceneLifeCycleServiceInterface
import SceneRouteServiceInterface

// MARK: ExampleSceneScopeDependencies

public typealias ExampleSceneScopeDependencies
    = DependencyProvider
    & SceneRouteServiceProvider
    & SharedSceneLifeCycleServiceProvider

// MARK: ExampleSceneScopeBuilder

public final class ExampleSceneScopeBuilder: DependencyContainer<ExampleSceneScopeDependencies> {}

// MARK: ExampleSceneScopeBuilder + SceneScopeBuilder

extension ExampleSceneScopeBuilder: SceneScopeBuilder {
    public func buildSceneScope() -> SceneScope {
        ExampleSceneScope(dependencies: dependencies)
    }
}
