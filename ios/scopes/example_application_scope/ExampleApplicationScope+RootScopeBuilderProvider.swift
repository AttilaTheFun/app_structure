import ApplicationFoundation
import Combine

extension ExampleApplicationScope: RootScopeBuilderProvider {
    public var rootScopeBuilder: RootScopeBuilder {
        stateScopeSubject.value.rootScopeBuilder
    }

    public var rootScopeBuilderPublisher: AnyPublisher<RootScopeBuilder, Never> {
        stateScopeSubject
            .map(\.rootScopeBuilder)
            .eraseToAnyPublisher()
    }
}
