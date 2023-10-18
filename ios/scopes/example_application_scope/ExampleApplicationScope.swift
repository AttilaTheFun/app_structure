import ApplicationFoundation
import ApplicationLifeCycleServiceInterface
import ApplicationLifeCycleServiceImplementation
import Combine
import DependencyFoundation
import ExampleSignedOutStateScope
import ExampleAuthenticationServiceInterface
import ExampleAuthenticationServiceImplementation

public typealias ExampleApplicationDependencies = Void

public final class ExampleApplicationScope: DependencyContainer<ExampleApplicationDependencies> {

    // MARK: Properties

    private var backingStateScopeSubject: CurrentValueSubject<ExampleApplicationStateScope, Never>!
    var stateScopeSubject: CurrentValueSubject<ExampleApplicationStateScope, Never> {
        self.backingStateScopeSubject
    }

    public let applicationLifeCycleService: ApplicationLifeCycleService
    public let exampleAuthenticationService: ExampleAuthenticationService

    // MARK: Initialization

    public override init(dependencies: ExampleApplicationDependencies) {
        self.applicationLifeCycleService = ApplicationLifeCycleServiceImplementation()
        self.exampleAuthenticationService = ExampleAuthenticationServiceImplementation()
        super.init(dependencies: dependencies)

        // Create the subject:
        let initialStateScope = self.initialScope()
        self.backingStateScopeSubject = CurrentValueSubject(initialStateScope)
    }

    // MARK: Private

    private func initialScope() -> ExampleApplicationStateScope {
        // TODO: Get session from session service and build home scope if signed in.
        return .signedOut(self.exampleSignedOutStateScopeBuilder.build())
    }
}