//
//  ViewController.swift
//  TextField
//
//  Created by Berkay Kuzu on 31.05.2023.
// The Wicked Queen's Challenge

import UIKit

class ViewController: UIViewController {
    
    let nameSurnameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Name-Surname"
        textField.textAlignment = .center
        textField.textColor = .red
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Email"
        textField.textAlignment = .center
        textField.textColor = .blue
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        return textField
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Enter Phone Number"
        
        textField.textAlignment = .center
        textField.textColor = .systemGreen
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "The Wicked Queen's Challenge 🧙🏻‍♀️"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .systemGray
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        setupUnderLinedTextField(frame: CGRect(x: 0, y: phoneNumberTextField.frame.height + 50 , width: 200, height: 1), phoneNumberTextField)
        nameSurnameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
    }


    private func setupUnderLinedTextField(frame: CGRect, _ texfield: UITextField) {
        let bottomLayer = CALayer()
        bottomLayer.frame = frame
        bottomLayer.backgroundColor = UIColor.black.cgColor
        texfield.layer.addSublayer(bottomLayer)
    }
    
    private func addSubviews() {
        view.addSubview(nameSurnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(appNameLabel)
        view.addSubview(phoneNumberTextField)

    }
    
    private func applyConstraints() {
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.centerX.equalTo(view)
            make.width.equalTo(350)
            make.height.equalTo(80)
        }
        
        nameSurnameTextField.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp_bottomMargin).offset(50)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(200)
            
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameSurnameTextField).offset(70)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField).offset(70)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameSurnameTextField {
            textField.resignFirstResponder()
            return false
                }
                return true
            }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberTextField {
            guard let range = Range(range, in: textField.text ?? "") else { return false  }
            let newText = (textField.text)?.replacingCharacters(in: range, with: string)
            return (newText?.count)! <= 10
        }
        return true
    }
    func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == emailTextField {
                if let email = textField.text, !isValidEmail(email) {
                    let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
}
