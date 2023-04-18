//
//  CreateUserDTO.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

struct CreateUserDTO: Encodable {
    let name: String
    let email: String
    let password: String
    let notifications: Bool
}
