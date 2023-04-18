//
//  ViewModel.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

class ViewModel {
    private let loginUseCases: LoginUseCasesProtocol
    
    init(loginUseCases: LoginUseCasesProtocol) {
        self.loginUseCases = loginUseCases
    }
    
    func createUser() {
        let user = CreateUserDTO(name: "Rafael", email: "rveronez20@gmail.com", password: "yma2578k", notifications: false)
        
        loginUseCases.createUser(user: user) { [weak self] user in
            print("Success! \(user)")
        } onFailure: { [weak self] error in
            print("Failure! \(error)")
        }

    }
}
