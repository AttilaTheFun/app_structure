import ApplicationFoundation
import ExampleSignedOutRootScope

extension ExampleSignedOutStateScope: RootScopeBuilder {
    public func buildRootScope(sceneScope: SceneScope) -> RootScope {
        ExampleSignedOutRootScopeBuilder(dependencies: self)
            .buildRootScope(sceneScope: sceneScope)
    }
}
