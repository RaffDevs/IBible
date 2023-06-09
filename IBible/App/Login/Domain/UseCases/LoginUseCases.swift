//
//  LoginUseCases.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

protocol LoginUseCasesProtocol {
    func createUser(user: CreateUserDTO, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    
    func getUser(email: GetUserDTO, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
}
