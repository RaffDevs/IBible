//
//  UserEntity.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

struct UserEntity: Decodable {
    let name: String
    let email: String
    let token: String
    let notifications: Bool
    let lastLogin: String?
}
