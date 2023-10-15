import ApplicationFoundation
import ExampleSignInFeature

extension ExampleSignedOutStateScope: RootScopeBuilder {
    public func buildRootScope(sceneScope: SceneScope) -> RootScope {
        ExampleSignInFeatureBuilder(dependencies: self)
            .buildRootScope(sceneScope: sceneScope)
    }
}
