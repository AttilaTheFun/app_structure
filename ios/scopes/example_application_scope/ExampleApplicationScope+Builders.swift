import ExampleSignedOutStateScope

extension ExampleApplicationScope {
    var exampleSignedOutStateScopeBuilder: ExampleSignedOutStateScopeBuilder {
        return ExampleSignedOutStateScopeBuilder(dependencies: self)
    }
}