//
//  ViewController.swift
//  BatmanAPI
//
//  Created by Berkay Kuzu on 24.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       label.text = "RESTful API 🦇"
       return label
   }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
//       label.text = "Berkay"
       return label
   }()
    
    let usernameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let citynameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let streetLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let phoneLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let websiteLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let companyLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let catchPhraseLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    let emailLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       //label.text = "Berkay"
       return label
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        fetchUsers()
    }

    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(citynameLabel)
        view.addSubview(streetLabel)
        view.addSubview(phoneLabel)
        view.addSubview(websiteLabel)
        view.addSubview(companyLabel)
        view.addSubview(catchPhraseLabel)
        view.addSubview(emailLabel)
        view.addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        citynameLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(citynameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(streetLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(websiteLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        catchPhraseLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(catchPhraseLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func fetchUsers() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.usernameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.name
                self.catchPhraseLabel.text = user.company.catchPhrase
                self.citynameLabel.text = user.address.city
                self.companyLabel.text = user.company.name
                self.phoneLabel.text = user.phone
                self.websiteLabel.text = user.website
            case .failure:
                self.nameLabel.text = "No user found"
            }
        }
    }
}

