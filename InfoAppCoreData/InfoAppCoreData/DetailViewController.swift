//
//  DetailViewController.swift
//  InfoAppCoreData
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = " ℹ️ Please write some info:"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        //label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.textAlignment = .left
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Surname"
        textField.textAlignment = .left
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Age"
        textField.textAlignment = .left
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.textAlignment = .left
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let othersTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Others"
        textField.textAlignment = .left
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        addSubviews()
        applyConstraints()
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        ]
    }
    
    @objc private func saveButtonTapped() {
//        let vc = ViewController()
//        navigationController?.popViewController(animated: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "InfoItem", in: context)
        let newInfoItem = InfoItem(entity: entity!, insertInto: context)
        newInfoItem.id = infoItemList.count as NSNumber
        newInfoItem.name = nameTextField.text
        newInfoItem.surname = surnameTextField.text
        newInfoItem.age = ageTextField.text
        newInfoItem.email = emailTextField.text
        newInfoItem.others = othersTextField.text
        
        do {
            try  context.save()
            infoItemList.append(newInfoItem)
            navigationController?.popViewController(animated: true)
        } catch {
            print("context save error")
        }
       
    
    }
    
    private func addSubviews() {
        view.addSubview(infoLabel)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(ageTextField)
        view.addSubview(emailTextField)
        view.addSubview(othersTextField)
    }
    
    private func applyConstraints() {
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        othersTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }

}
