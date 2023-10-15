import ExampleSignInFeature
import ExampleSignInFeatureInterface

extension ExampleLoggedOutRootScope {
    var exampleSignInBuilder: ExampleSignInBuilder {
        ExampleSignInBuilder(dependencies: self)
    }
}
