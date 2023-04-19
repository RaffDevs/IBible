//
//  User.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

// MARK: - Model

struct User {
    let name: String
    let email: String
    let token: String
    let notifications: Bool
    let lastLogin: String?
}


// MARK: - Mappers

extension User {
    static func mapperUserEntityToModel(entity: UserEntity) -> User {
        let user = User(
            name: entity.name,
            email: entity.email,
            token: entity.token,
            notifications: entity.notifications,
            lastLogin: entity.lastLogin
        )
        
        return user
    }
    
}

// MARK: - DTO

extension User {
    static func createUserDTO(name: String, email: String, password: String, notification: Bool) -> CreateUserDTO {
        let createUserDTO = CreateUserDTO(
            name: name,
            email: email,
            password: password,
            notifications: notification
        )
        
        return createUserDTO
    }
    
    static func getUserDTO(email: String) -> GetUserDTO {
        let getUserDTO = GetUserDTO(email: email)
        return getUserDTO
    }
}
