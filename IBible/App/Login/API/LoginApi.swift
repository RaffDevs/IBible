//
//  LoginAPI.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import Foundation

protocol LoginApiProtocol {
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void)
    func getUser(email: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void)
}
