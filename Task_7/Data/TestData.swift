import Foundation

struct TestData: Codable {
    let token: String
    let data: DataClass
    
    init(token: String, data: DataClass) {
        self.token = token
        self.data = data
    }
}

struct DataClass: Codable {
    let id, email, gender: String
    let dataRepeat: Int
    let lastLogin: TestLastLogin
    
    init(id: String, email: String, gender: String, lastLogin: TestLastLogin, dataRepeat: Int) {
        self.id = id
        self.email = email
        self.gender = gender
        self.lastLogin = lastLogin
        self.dataRepeat = dataRepeat
    }

    enum CodingKeys: String, CodingKey {
        case id, email, gender
        case lastLogin = "last_login"
        case dataRepeat = "_repeat"
    }
}

struct TestLastLogin: Codable {
    let dateTime, ip4: String
    
    init(dateTime: String, ip4: String) {
        self.dateTime = dateTime
        self.ip4 = ip4
    }

    enum CodingKeys: String, CodingKey {
        case dateTime = "date_time"
        case ip4
    }
}
