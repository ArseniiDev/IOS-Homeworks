//
//  CredentialsVerification.swift
//  Gusev-IOSHW-3.1.1+3.1.2
//
//  Created by Arseniy Gusev on 9/8/23.
//

import UIKit

class User {
    let login: String
    let fullName: String
    let avatar: UIImage
    var status: String
    let password: String

    init(login: String, fullName: String, avatar: UIImage, status: String, password: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
        self.password = password
    }
}

protocol UserService {
    func getUser(withLogin login: String, password: String) -> User?
}

class CurrentUserService: UserService {
    private let user: User

    init(currentUser: User) {
        self.user = currentUser
    }

    func getUser(withLogin login: String, password: String) -> User? {
        if let authenticatedUser = dummyUsers.first(where: { $0.login == login && $0.password == password }) {
            return authenticatedUser
        } else {
            return nil
        }
    }
}

class TestUserService: UserService {
    private let testUser: User

    init(testUser: User) {
        self.testUser = testUser
    }

    func getUser(withLogin login: String, password: String) -> User? {
        if login == defaultTestUser.login && password == defaultTestUser.password {
            return defaultTestUser
        }
        return nil
    }
}



struct Images {
    static let firstavatar: UIImage? = UIImage(named: "firstavatar")
    static let secondavatar: UIImage? = UIImage(named: "secondavatar")

}

let defaultTestUser = User(
    login: "usertest",
    fullName: "User Test",
    avatar: UIImage(named: "test") ?? UIImage(),
    status: "Test mode",
    password: "1113"
)

let dummyUsers: [User] = [
    User(login: "user1", fullName: "User One", avatar: Images.firstavatar ?? UIImage() , status: "Online", password: "1111"),
    User(login: "user2", fullName: "User Two", avatar: Images.secondavatar ?? UIImage(), status: "Offline", password: "1112")
]
