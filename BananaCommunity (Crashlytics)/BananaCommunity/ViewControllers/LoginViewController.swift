//
//  LoginViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter email"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //textField.isSecureTextEntry = true
        //        textField.textContentType = .oneTimeCode
        //        textField.inputView = UIView()
        textField.isSecureTextEntry = true
        textField.keyboardType = .asciiCapable
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in Screen"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 32)
        //label.isHidden = true
        let attributedText = NSAttributedString(string: label.text ?? "",
                                                attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.attributedText = attributedText
        return label
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up with new account", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
        closeKeyboard()
    }
    
    private func closeKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func addSubviews() {
        view.addSubview(logInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signupButton)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
    }
    
    private func applyConstraints() {
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(logInLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
//            make.height.equalTo(50)
//            make.width.equalTo(200)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
//            make.height.equalTo(50)
//            make.width.equalTo(200)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        signupButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.bottom.equalTo(signupButton.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
    }
    
    @objc private func signupButtonTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        
        if passwordTextField.text != "" && emailTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    if let authData = authData {
                        let user = authData.user
                        if user.isEmailVerified {
                            let vc = MainTabBarTabBarViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                            self.makeAlert(titleInput: "Log in successful!", messageInput: "You logged in succesfully!")
                        } else {
                            self.makeAlert(titleInput: "Error!", messageInput: "Your email is not verified! Please verify your email!")
                        }
                    }
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Please enter Username/Password!")
        }
    }
    
    @objc private func forgotPasswordButtonTapped() {
        //        guard let email = emailTextField.text, !email.isEmpty else {
        //                return
        //            }
        guard let email = emailTextField.text else {return}
        //        let password = passwordTextField.text
        
        if email != "" {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    // Handle password reset error
                    print("Password reset error: \(error.localizedDescription)")
                    self.makeAlert(titleInput: "Error", messageInput: "\(error.localizedDescription)")
                } else {
                    // Password reset email sent successfully
                    print("Password reset email sent to \(email)")
                    self.makeAlert(titleInput: "Success", messageInput: "Please, check your email to reset your password!")
                }
            }
        } else {
            makeAlert(titleInput: "Alert!", messageInput: "Please, enter your Email/Password!")
        }
    }
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0, let firstCharacter = string.first {
            textField.text = String(firstCharacter.lowercased())
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField  {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
}

