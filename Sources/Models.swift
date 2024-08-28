import Foundation

struct Subscriber: Decodable {
    let id: UUID
    var name: String?
    let email: String
    let createdAt: String
    let receiveEmails: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case createdAt = "created_at"
        case receiveEmails = "receive_emails"
    }
}
