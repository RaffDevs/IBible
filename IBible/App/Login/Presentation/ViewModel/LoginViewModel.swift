//
//  ViewModel.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func onCreateUserFailure(message: String)
}

class LoginViewModel {
    //MARK: - Properties
    private let loginUseCases: LoginUseCasesProtocol
    private weak var delegate: LoginViewModelDelegate?
    
    // MARK: - Initializers
    init(loginUseCases: LoginUseCasesProtocol) {
        self.loginUseCases = loginUseCases
    }
    
    // MARK: - Methods
    func setupDelegate(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }
    
    func createUser(name: String, email: String, password: String, notification: Bool) {
        let user = CreateUserDTO(name: name, email: email, password: password, notifications: notification)
                
        loginUseCases.createUser(user: user) { user in
            print("Success! \(user)")
        } onFailure: { error in
            print("Erro \(error)")
            self.delegate?.onCreateUserFailure(message: error.localizedDescription)
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
