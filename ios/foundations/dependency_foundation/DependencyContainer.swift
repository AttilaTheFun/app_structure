/**
 A dependency container is the base type for scopes, builders and route handlers.
 Dependency containers propagate a set of dependencies and may augment these with their own, 
 additional dependencies. The root dependency provider, the AppScope, should have Void dependencies.
 */
open class DependencyContainer<Dependencies>: DependencyProvider {
    public let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
