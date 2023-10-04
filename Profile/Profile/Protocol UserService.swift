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


    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

 protocol UserService {

    func getUser() -> User?
}

var user: [User] = []

extension UserService {
    func getUser() -> User? {
        if let authenticatedUser = user.first(where: { $0.login == "dummyuser"}) {
            return authenticatedUser
        } else {
            return nil
        }
    }

}
