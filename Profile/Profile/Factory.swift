//
//  File.swift
//  Gusev-IOSHW-3.4
//
//  Created by Arseniy Gusev on 10/3/23.
//

import UIKit

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}

struct LoginInspector: LoginViewControllerDelegate {
     func check(login: String, password: String) -> Bool {
         return Checker.shared.check(login: login, password: password)
     }
 }
