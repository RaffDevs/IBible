//
//  LoginViewController.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import UIKit
import NotificationBannerSwift

class LoginViewController: UIViewController {
    private var loginView: LoginView?
    private let loginViewModel: LoginViewModel = LoginContainer.shared.container.resolve(LoginViewModel.self)!
    
    override func loadView() {
        loginView = LoginView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView?.setupDelegate(delegate: self)
        loginViewModel.setupDelegate(delegate: self)

    }

}

extension LoginViewController: LoginViewDelegate {
    func login(name: String, email: String, password: String, notification: Bool) {
        loginViewModel.createUser(name: name, email: email, password: password, notification: notification)
    }
    
    func invalidTextfieldData() {
        let errorMessage = """
            Por favor, verifique os campos!
            Campos não podem ser vazios e senhas precisam ter no minimo 6 caracteres.
        """
        let alert = UIAlertController(title: "Formuláro com erro", message: errorMessage, preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionOK)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    func onCreateUserFailure(message: String) {
        DispatchQueue.main.async {
            let banner = NotificationBanner(
                title: message,
                style: .danger
            )
            
            banner.duration = 2
            banner.show(on: self)
        }
        
    }
    
    
}
