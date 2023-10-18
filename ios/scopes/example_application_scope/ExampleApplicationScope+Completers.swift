import ExampleAuthenticationServiceInterface
import ExampleSignInFeatureInterface

// MARK: ExampleApplicationScope + ExampleSignInCompleter

extension ExampleApplicationScope: ExampleSignInCompleter {
    public func completeSignIn(with session: Session) {
        // TODO
        print("Completed sign in")
        // let onboardingScope = sharedOnboardingScopeBuilder.build(userSession: userSession)
        // stateScopeSubject.send(.onboarding(onboardingScope))
    }
}
