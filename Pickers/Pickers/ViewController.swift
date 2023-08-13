//
//  ViewController.swift
//  Pickers
//
//  Created by Berkay Kuzu on 6.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Your name"
        textField.textColor = .black
        textField.isUserInteractionEnabled = true
        textField.keyboardType = .default
        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        textField.font = UIFont.boldSystemFont(ofSize: 16)

        return textField
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "user1.png")
        return imageView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        configureNavBar()
//        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("colorChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(profilePhotoChanged(_:)), name: Notification.Name("ProfilePhotoChanged") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(backgroundColorChanged(_:)), name: Notification.Name("BackgroundColorChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ageChanged(_:)), name: Notification.Name("AgeChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(_:)), name: Notification.Name("FontChanged"), object: nil)
    }
    
    @objc func profilePhotoChanged(_ notification: Notification) {
        if let newPhoto = notification.object as? UIImage {
            iconImageView.image = newPhoto
        }
    }
    
    @objc func backgroundColorChanged(_ notification: Notification) {
        if let newBackgroundColor = notification.object as? UIColor {
            view.backgroundColor = newBackgroundColor
        }
    }
    
    @objc func ageChanged(_ notification: Notification) {
        if let ageArray = notification.object as? [Any?], let age = ageArray.first as? Int {
            ageLabel.text = "Your Age: \(age)"
        }
    }
    
    @objc func fontChanged(_ notification: Notification) {
        if let descriptor = notification.object as? UIFontDescriptor {
                let newFont = UIFont(descriptor: descriptor, size: 20)
                nameLabel.font = newFont
                ageLabel.font = newFont
            }
    }

    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to First Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        view.addSubview(nextButton)
        view.addSubview(nameLabel)
        view.addSubview(iconImageView)
        view.addSubview(ageLabel)
        view.addSubview(nameTextField)
    }
    
    private func applyConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(100)
            //make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    @objc private func nameTextFieldDidChange() {
        print("Name Text Field Tapped")
        nameLabel.text = nameTextField.text
    }
    
    @objc private func nextButtonTapped() {
        print("Next Button Tapped")
        let controller = SecondViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

