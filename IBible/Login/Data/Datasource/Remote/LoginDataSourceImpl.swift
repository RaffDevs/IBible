//
//  LoginDataSource.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

class LoginDataSourceImpl: LoginDataSourceProtocol {
    private var bibliaAPI: BibliaApi
    
    init(bibliaAPI: BibliaApi) {
        self.bibliaAPI = bibliaAPI
    }
    
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        bibliaAPI.createUser(user: user) { result in
            switch(result) {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUser(email: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        bibliaAPI.getUser(user: email) { result in
            switch(result) {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
