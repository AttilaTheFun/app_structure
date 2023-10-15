import Combine

public protocol ExampleAuthenticationService {
    func logIn(username: String, password: String) -> AnyPublisher<Session, Error> 
}

public protocol ExampleAuthenticationServiceProvider {
    var exampleAuthenticationService: ExampleAuthenticationService { get }
}