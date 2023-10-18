import ApplicationFoundation
import ExampleSignedOutStateScope

enum ExampleApplicationStateScope {
    case signedOut(ExampleSignedOutStateScope)
}

extension ExampleApplicationStateScope {
    var rootScopeBuilder: RootScopeBuilder {
        switch self {
        case let .signedOut(signedOutStateScope):
            signedOutStateScope
        }
    }
}
