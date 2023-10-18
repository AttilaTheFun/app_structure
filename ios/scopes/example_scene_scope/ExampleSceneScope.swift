import DependencyFoundation
import SceneLifeCycleServiceImplementation
import SceneLifeCycleServiceInterface
import SceneRouteServiceImplementation
import SceneRouteServiceInterface

// MARK: ExampleSceneScope

public final class ExampleSceneScope: DependencyContainer<ExampleSceneScopeDependencies> {
    public let sceneLifeCycleService: SceneLifeCycleService

    override init(dependencies: ExampleSceneScopeDependencies) {
        // Create the scene life cycle service:
        self.sceneLifeCycleService = SceneLifeCycleServiceImplementation(
            sharedSceneLifeCycleService: dependencies.sharedSceneLifeCycleService
        )

        super.init(dependencies: dependencies)
    }
}
