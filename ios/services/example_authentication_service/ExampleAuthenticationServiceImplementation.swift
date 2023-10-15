import Combine
import ExampleAuthenticationServiceInterface
import Foundation

public final class ExampleAuthenticationServiceImplementation: ExampleAuthenticationService {
    public init() {}

    public func logIn(username: String, password: String) -> AnyPublisher<Session, Error> {
        return Just(Session(id: UUID(), token: "abcdef"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
