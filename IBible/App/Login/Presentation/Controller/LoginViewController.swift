//
//  LoginViewController.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import UIKit

class LoginViewController: UIViewController {
    private var loginView: LoginView?
    
    override func loadView() {
        loginView = LoginView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView?.setupDelegate(delegate: self)

    }

}

extension LoginViewController: LoginViewDelegate {
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
