//
//  LoginDataSource.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

protocol LoginDataSourceProtocol {
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void)
    func getUser(email: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void)
}
