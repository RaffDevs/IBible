//
//  LoginRepositoryImpl.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

class LoginRepositoryImpl: LoginRepositoryProtocol {
    private var loginDataSource: LoginDataSourceProtocol
    
    init(loginDataSource: LoginDataSourceProtocol) {
        self.loginDataSource = loginDataSource
    }
    
    
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        loginDataSource.createUser(user: user) { result in
            switch(result) {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUser(email: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        loginDataSource.getUser(email: email) { result in
            switch(result) {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
