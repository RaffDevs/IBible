//
//  LoginView.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import UIKit

class LoginView: UIView {
    // MARK: - Elements
    
    lazy var appLogo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ibibleLogo")
        imageView.contentMode = .scaleAspectFill
        let gradientView = UIView()
        gradientView.frame = imageView.frame
        gradientView.backgroundColor = UIColor(red: 0.067, green: 0.071, blue: 0.075, alpha: 0)
        imageView.addSubview(gradientView)
                
        return imageView
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.placeholder = "Nome"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.addTarget(self, action: #selector(isTextFieldEmpty), for: .editingChanged)
        
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.addTarget(self, action: #selector(isTextFieldEmpty), for: .editingChanged)

        
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
        textField.addTarget(self, action: #selector(isPasswordValid), for: .editingChanged)

        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        
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
    
    private func setupElements() {
        addSubview(appLogo)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: topAnchor, constant: -200),
            appLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            appLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            appLogo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100),
            
            
            nameTextField.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc
    private func isTextFieldEmpty(_ textField: UITextField) -> Bool {
        return textField.text?.isEmpty ?? true
    }
    
    @objc func isPasswordValid(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        
        if text.count >= 6 {
            return true
        }
        
        return false
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
