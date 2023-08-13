//
//  VerificationViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import FirebaseAuth


class VerificationViewController: UIViewController {

    private let verificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Please click Send Verification Email to get a verification link."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let sendVerificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Verification Email", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(sendVerificationEmailTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
    }
    
    private func addSubviews() {
        view.addSubview(verificationLabel)
        view.addSubview(sendVerificationButton)
    }
    
    private func applyConstraints() {
        verificationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        sendVerificationButton.snp.makeConstraints { make in
            make.top.equalTo(verificationLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func sendVerificationEmailTapped() {
        guard let user = Auth.auth().currentUser else {return}
        
        user.sendEmailVerification { error in
            if let error = error {
                print("Failed to send verification email: \(error.localizedDescription)")
                self.makeAlert(titleInput: "Error", messageInput: "The verification email could not be sent!")
            } else {
                print("Verification email sent successfully.")
                self.makeAlert(titleInput: "The verification email was sent successfully", messageInput: "Please, check your email box and go back to register screen!")
//                let vc = MainViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
    }

}

