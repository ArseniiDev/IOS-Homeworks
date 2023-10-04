//
//  Singleton.swift
//  Gusev-IOSHW-3.4
//
//  Created by Arseniy Gusev on 9/13/23.
//

import UIKit

final class Checker {

    static let shared = Checker()

    private let login = "user"

    private let password = "111"

    func check (login: String, password: String) -> Bool {
        if self.login == login && self.password == password {
            return true
        } else {
            return false
        }

    }

}


protocol LoginViewControllerDelegate {
    func check (login: String, password: String) -> Bool
}
