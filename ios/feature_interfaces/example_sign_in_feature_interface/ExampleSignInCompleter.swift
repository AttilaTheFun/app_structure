import DependencyFoundation
import ExampleAuthenticationServiceInterface

// MARK: ExampleSignInCompleter

public protocol ExampleSignInCompleter {

    /**
     Tells the completer to complete the sign in flow with the given session.
     */
    func completeSignIn(with session: Session)
}

// MARK: ExampleSignInCompleterProvider

public protocol ExampleSignInCompleterProvider {
    var exampleSignInCompleter: ExampleSignInCompleter { get }
}
