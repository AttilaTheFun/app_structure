import ApplicationFoundation
import ExampleApplicationScope

@main
final class ApplicationDelegate: BaseApplicationDelegate {
    private let exampleApplicationScope = ExampleApplicationScope(dependencies: ())

    override var applicationScope: ApplicationScope {
        self.exampleApplicationScope
    }
}
