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

    }

}
