//
//  LoginView.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func invalidTextfieldData()
    
}

class LoginView: UIView {
    //MARK: - Properts
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Elements
    
    lazy var appLogo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ibibleLogo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.placeholder = "Nome"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.delegate = self

        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.placeholder = "Senha"
        textField.delegate = self

        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.backgroundColor = .
        
        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
        setupConstraints()
        self.backgroundColor = .primaryBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupDelegate(delegate: LoginViewDelegate) {
        self.delegate = delegate
    }
    
    private func setupElements() {
        addSubview(appLogo)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            appLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            appLogo.widthAnchor.constraint(equalToConstant: 200),
            appLogo.heightAnchor.constraint(equalToConstant: 200),
            
            
            nameTextField.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    // MARK: - Actions
    
    private func validateLoginTextField() -> Bool {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            
            self.delegate?.invalidTextfieldData()
            return false
        }
        
        if name.isEmpty || email.isEmpty || password.isEmpty {
            self.delegate?.invalidTextfieldData()
            return false
        }
        
        if password.count < 6 {
            self.delegate?.invalidTextfieldData()
            return false
        }
        
        return true
    }
    
    @objc
    func loginTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            self.delegate?.invalidTextfieldData()
            return
        }
        
        if (validateLoginTextField()) {
            print("Sucesso! \(name) \(email) \(password)")
        } else {
            self.delegate?.invalidTextfieldData()
        }
        
        
    }
}

// MARK: - Extensions

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
