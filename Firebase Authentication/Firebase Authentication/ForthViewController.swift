//
//  ForthViewController.swift
//  Firebase Authentication
//
//  Created by Berkay Kuzu on 19.06.2023.
//

import UIKit
import FirebaseAuth

class ForthViewController: UIViewController {
    
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
        view.backgroundColor = .brown
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        //configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Main Page", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func addSubviews() {
        view.addSubview(logoutButton)
    }
    
    private func applyConstraints() {
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }
    
    @objc private func logoutButtonTapped() {
        
        do {
            try Auth.auth().signOut()
            let vc = MainViewController()
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            print("There is an error regarding loging out!")
        }
       
    }

}
