/**
 An empty, base protocol to which all other dependencies typealiases should conform.
 The base builders and scopes conform to this automatically.
 This is useful for typealiases for empty dependencies (they can't use void).

 Usage:

 public typealias FooFeatureDependencies = DependencyProvider

 public typealias BarFeatureDependencies
    = DependencyProvider
    & FooServiceProvider
    & BarServiceProvider
 */
public protocol DependencyProvider: AnyObject {}
