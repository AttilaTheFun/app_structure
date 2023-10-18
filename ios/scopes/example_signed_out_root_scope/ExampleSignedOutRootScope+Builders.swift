import ExampleSignInFeature
import ExampleSignInFeatureInterface

extension ExampleSignedOutRootScope {
    var exampleSignInBuilder: ExampleSignInBuilder {
        ExampleSignInBuilder(dependencies: self)
    }
}
