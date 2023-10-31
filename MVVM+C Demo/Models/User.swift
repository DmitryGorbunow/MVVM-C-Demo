//
//  User.swift
//  MVVM+C Demo
//
//  Created by Dmitry Gorbunow on 10/29/23.
//

import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
        User(login: "dmitry", password: "123456")
    ]
}
