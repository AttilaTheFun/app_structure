import DependencyFoundation
import ApplicationFoundation
import ApplicationLifeCycleServiceInterface
import ApplicationLifeCycleServiceImplementation

public typealias ExampleApplicationDependencies = Void

public final class ExampleApplicationScope: DependencyContainer<ExampleApplicationDependencies> {
    public let applicationLifeCycleService: ApplicationLifeCycleService

    public override init(dependencies: ExampleApplicationDependencies) {
        self.applicationLifeCycleService = ApplicationLifeCycleServiceImplementation()
        super.init(dependencies: dependencies)
    }
}