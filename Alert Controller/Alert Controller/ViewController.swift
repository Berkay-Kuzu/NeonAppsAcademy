//
//  ViewController.swift
//  Alert Controller
//
//  Created by Berkay Kuzu on 3.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pinocchio's Alert Adventure"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let pinocchioButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "tree", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let pinocchioButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemMint
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "fossil.shell", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButton2Tapped), for: .touchUpInside)
        return button
    }()
    
    private let pinocchioButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "leaf.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButton3Tapped), for: .touchUpInside)
        return button
    }()
    
    private let pinocchioButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "leaf", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButton4Tapped), for: .touchUpInside)
        return button
    }()
    
    private let pinocchioButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "atom", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButton5Tapped), for: .touchUpInside)
        return button
    }()
    
    private let pinocchioButton6: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "microbe", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pinocchioButton6Tapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
    }

    
    private func addSubviews() {
        view.addSubview(appNameLabel)
        view.addSubview(pinocchioButton)
        view.addSubview(pinocchioButton2)
        view.addSubview(pinocchioButton3)
        view.addSubview(pinocchioButton4)
        view.addSubview(pinocchioButton5)
        view.addSubview(pinocchioButton6)
    }
    
    private func applyConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(80)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            //make.centerX.equalTo(view)
        }
        
        pinocchioButton.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        pinocchioButton2.snp.makeConstraints { make in
            make.top.equalTo(pinocchioButton.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        pinocchioButton3.snp.makeConstraints { make in
            make.top.equalTo(pinocchioButton2.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        pinocchioButton4.snp.makeConstraints { make in
            make.top.equalTo(pinocchioButton3.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        pinocchioButton5.snp.makeConstraints { make in
            make.top.equalTo(pinocchioButton4.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        pinocchioButton6.snp.makeConstraints { make in
            make.top.equalTo(pinocchioButton5.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
    }
    
    @objc private func pinocchioButtonTapped() {
        let alert = UIAlertController(title: "There is only title and subtitle", message: "There is no button to close this alert. Please, reopen the app :(", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func pinocchioButton2Tapped() {
        let alert = UIAlertController(title: "Pinocchio Button", message: " You tapped Pinocchio Button", preferredStyle: .alert)
        let buttonTitle = "OK"
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            print("Button Title: \(buttonTitle)")
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func pinocchioButton3Tapped() {
        let alert = UIAlertController(title: "Pinocchio Button", message: " You tapped Pinocchio Button", preferredStyle: .alert)
        let buttonTitle = "OK"
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            print("Button Title: \(buttonTitle)")
        }
        let buttonTitle2 = "Cancel"
        let cancelAction = UIAlertAction(title: buttonTitle2, style: .default) { _ in
            print("Button Title: \(buttonTitle2)")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func pinocchioButton4Tapped() {
        let alertController = UIAlertController(title: "Pinocchio waits you to enter a text :)", message: "Please enter some text for Pinocchio", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Please enter your text"
            }
        let confirmAction = UIAlertAction(title: "Save", style: .default) { [weak alertController] _ in
                guard let textField = alertController?.textFields?.first, let text = textField.text else { return }
                print("Entered Text: \(text)")
            }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func pinocchioButton5Tapped() {
        let actionSheet = UIAlertController(title: "Pinocchio Action Sheet Title", message: "Pinocchio Action Sheet Message", preferredStyle: .actionSheet)
        
            let option1Action = UIAlertAction(title: "Pinocchio's First Action", style: .default) { _ in
                print("Pinocchio's First Action selected")
            }
            actionSheet.addAction(option1Action)
        
            let option2Action = UIAlertAction(title: "Pinocchio's Second Action", style: .default) { _ in
                print("Pinocchio's Second Action selected")
            }
            actionSheet.addAction(option2Action)
            
        let cancelAction = UIAlertAction(title: "Pinocchio Cancel", style: .cancel) { _ in
            print("Pinocchio Cancel selected")
        }
            actionSheet.addAction(cancelAction)
            
            present(actionSheet, animated: true, completion: nil)
    }
    
    @objc private func pinocchioButton6Tapped() {
        let activityControllerImage = UIImage(named: "neon.jpeg")
        let activityControllerText = "Big brother is watching you👁️"
        let activityConrollerFile = Bundle.main.url(forResource: "1984-level 4", withExtension: "pdf")
        let activityControllerItems: [Any] = [activityControllerText , activityControllerImage, activityConrollerFile]
        let activityController = UIActivityViewController(activityItems: activityControllerItems, applicationActivities: nil)
            activityController.popoverPresentationController?.sourceView = self.view
            activityController.title = "Pinocchio's Activity Controller"
            
            
            present(activityController, animated: true, completion: nil)
    }

    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
    }
}

