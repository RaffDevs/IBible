//
//  LoginView.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func invalidTextfieldData()
    func login(name: String, email: String, password: String, notification: Bool)
    
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
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        let attributedPlaceholder = NSAttributedString(string: "Nome", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.placeholder = "Nome"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.textColor = .white
        textField.backgroundColor = .secondaryBackground()
        textField.attributedPlaceholder = attributedPlaceholder

        
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        let attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = .secondaryBackground()
        textField.attributedPlaceholder = attributedPlaceholder


        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        let attributedPlaceholder = NSAttributedString(string: "Senha", attributes: attributes)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.placeholder = "Senha"
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = .secondaryBackground()
        textField.attributedPlaceholder = attributedPlaceholder


        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .primary()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var notificationSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.tintColor = .gray
        switchButton.onTintColor = .primary()
        switchButton.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
        return switchButton
        
    }()
    
    lazy var switchDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Receber novidades no email?"
        label.textColor = .white
        
        return label
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
        addSubview(notificationSwitch)
        addSubview(switchDescriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            appLogo.topAnchor.constraint(equalTo: topAnchor, constant: 70),
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
            
            notificationSwitch.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            
            notificationSwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            switchDescriptionLabel.centerYAnchor.constraint(equalTo: notificationSwitch.centerYAnchor),
            switchDescriptionLabel.leadingAnchor.constraint(equalTo: notificationSwitch.trailingAnchor, constant: 20),
            
            loginButton.topAnchor.constraint(equalTo: notificationSwitch.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
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
        
        let notification = notificationSwitch.isOn
        
        if (validateLoginTextField()) {
            self.delegate?.login(name: name, email: email, password: password, notification: notification)
        } else {
            self.delegate?.invalidTextfieldData()
        }
        
    }
    
    @objc
    func toggleSwitch(_ sender: UISwitch) {
        print(sender.isOn)
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
