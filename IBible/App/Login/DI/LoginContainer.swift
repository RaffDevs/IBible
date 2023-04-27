//
//  DIContainer.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation
import Swinject

class LoginContainer {
    static let shared = LoginContainer()
    
    let container: Container
    
    private init() {
        container = Container()
        
        container.register(LoginApiProtocol.self) { _ in LoginApiImpl()}
        
        container.register(LoginDataSourceProtocol.self) { r in
            LoginDataSourceImpl(loginApi: r.resolve(LoginApiProtocol.self)!)
        }
        
        container.register(LoginRepositoryProtocol.self) { r in
            LoginRepositoryImpl(loginDataSource: r.resolve(LoginDataSourceProtocol.self)!)
        }
        
        container.register(LoginUseCasesProtocol.self) { r in
            LoginUseCasesImpl(loginRepository: r.resolve(LoginRepositoryProtocol.self)!)
        }
        
        container.register(LoginViewModel.self) { r in
            LoginViewModel(loginUseCases: r.resolve(LoginUseCasesProtocol.self)!)
        }
    }
}
