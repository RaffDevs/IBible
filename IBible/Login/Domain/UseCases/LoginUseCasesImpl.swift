//
//  LoginUseCasesImpl.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

class LoginUseCasesImpl: LoginUseCasesProtocol {
    private var loginRepository: LoginRepositoryProtocol
    
    init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }
    
    func createUser(user: CreateUserDTO, onSuccess: @escaping (UserEntity) -> Void, onFailure: @escaping (Error) -> Void) {
        loginRepository.createUser(user: user) { result in
            switch (result) {
            case .success(let user):
                onSuccess(user)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getUser(email: GetUserDTO, onSuccess: @escaping (UserEntity) -> Void, onFailure: @escaping (Error) -> Void) {
        loginRepository.getUser(email: email) { result in
            switch (result) {
            case .success(let user):
                onSuccess(user)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
   
    
    
}
