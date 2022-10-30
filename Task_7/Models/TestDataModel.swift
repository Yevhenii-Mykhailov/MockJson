import Foundation

struct TestDataModel: Codable {
    let email, gender, id: String
    let lastLogin: LastLogin

    enum CodingKeys: String, CodingKey {
        case email, gender, id
        case lastLogin = "last_login"
    }
}

struct LastLogin: Codable {
    let dateTime, ip4: String

    enum CodingKeys: String, CodingKey {
        case dateTime = "date_time"
        case ip4
    }
}
