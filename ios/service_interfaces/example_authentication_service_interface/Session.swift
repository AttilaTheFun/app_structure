import Foundation

public struct Session: Hashable, Codable {
    public let id: UUID
    public let token: String

    public init(id: UUID, token: String) {
        self.id = id
        self.token = token
    }
}