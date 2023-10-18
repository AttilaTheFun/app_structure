import ExampleAuthenticationServiceInterface
import ExampleSignInFeatureInterface

// MARK: ExampleApplicationScope + ExampleSignInCompleter

extension ExampleApplicationScope: ExampleSignInCompleter {
    public func completeSignIn(with session: Session) {
        // TODO
        // let onboardingScope = sharedOnboardingScopeBuilder.build(userSession: userSession)
        // stateScopeSubject.send(.onboarding(onboardingScope))
    }
}