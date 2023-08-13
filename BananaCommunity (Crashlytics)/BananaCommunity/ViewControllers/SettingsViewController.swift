//
//  SettingsViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    private let uploadLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Change your user photo"
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.font = .boldSystemFont(ofSize: 25)
//        //label.isHidden = true
//        return label
//    }()
    
//    private let userImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "click1.png")
//        imageView.isUserInteractionEnabled = true
//        return imageView
//    }()
    
//    private let changeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Change", for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.backgroundColor = .systemYellow
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 8
//        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
//        return button
//    }()

    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log out", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
//        gestureRecognizer()
        //configureNavBar()
    }
    
//    private func configureNavBar() {
//        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.tintColor = .black
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Main Page", style: .done, target: nil, action: nil)
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationItem.largeTitleDisplayMode = .always
//    }
    
    private func addSubviews() {
        view.addSubview(logoutButton)
//        view.addSubview(uploadLabel)
//        view.addSubview(userImageView)
//        view.addSubview(changeButton)
    }
    
    private func applyConstraints() {
        
//        uploadLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
//            make.centerX.equalToSuperview()
//        }
//
//        userImageView.snp.makeConstraints { make in
//            make.top.equalTo(uploadLabel.snp.bottom).offset(32)
//            make.centerX.equalToSuperview()
//            make.width.height.equalTo(150)
//        }
//
//        changeButton.snp.makeConstraints { make in
//            make.top.equalTo(userImageView.snp.bottom).offset(32)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(100)
//            make.height.equalTo(50)
//        }
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }
    
//    private func gestureRecognizer() {
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
//        userImageView.addGestureRecognizer(gestureRecognizer)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            userImageView.image = pickedImage
//            dismiss(animated: true, completion: nil)
//        }
//    }
//
//    @objc private func chooseImage() {
//        let pickerController = UIImagePickerController()
//        pickerController.delegate = self
//        pickerController.sourceType = .photoLibrary
//        present(pickerController, animated: true, completion: nil)
//    }
    
//    @objc private func changeButtonTapped() {
//
//    }
    
    @objc private func logoutButtonTapped() {
        
        do {
            try Auth.auth().signOut()
            let vc = RegisterViewController()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            print("There is an error regarding loging out!")
        }
    }
}
