//
//  DIContainer.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation
import Swinject

class DIContainer {
    static let shared = DIContainer()
    
    let container: Container
    
    private init() {
        container = Container()
        
        container.register(BibliaApi.self) { _ in
            return BibliaApi()
        }
        
        container.register(LoginDataSourceProtocol.self) { r in
            LoginDataSourceImpl(bibliaAPI: r.resolve(BibliaApi.self)!)
        }
        
        container.register(LoginRepositoryProtocol.self) { r in
            LoginRepositoryImpl(loginDataSource: r.resolve(LoginDataSourceProtocol.self)!)
        }
        
        container.register(LoginUseCasesProtocol.self) { r in
            LoginUseCasesImpl(loginRepository: r.resolve(LoginRepositoryProtocol.self)!)
        }
        
        container.register(ViewModel.self) { r in
            ViewModel(loginUseCases: r.resolve(LoginUseCasesProtocol.self)!)
        }
    }
}
