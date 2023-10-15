import ApplicationFoundation
import ExampleLoggedOutStateScope

enum ExampleApplicationStateScope {
    case loggedOut(ExampleLoggedOutStateScope)
}

extension ExampleApplicationStateScope {
    var rootScopeBuilder: RootScopeBuilder {
        switch self {
        case let .loggedOut(loggedOutStateScope):
            loggedOutStateScope
        }
    }
}
