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
        
        loginUseCases.createUser(user: user) { user in
            print("Success! \(user)")
        } onFailure: { error in
            print("Failure! \(error)")
        }

    }
    
    func getUser() {
        let email = GetUserDTO(email: "rveronez20@gmail.com")
        
        loginUseCases.getUser(email: email) { user in
            print("Success! \(user)")
        } onFailure: { error in
            print("Failure! \(error)")
        }

        
    }
}
