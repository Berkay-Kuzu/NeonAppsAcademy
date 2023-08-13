//
//  ViewController.swift
//  Stack View
//
//  Created by Berkay Kuzu on 4.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Harry Potter's Stack View Challenge 🧙‍♂️"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let harryPotterLabel1: UILabel = {
        let label = UILabel()
        label.text = "STUPEFY"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let harryPotterLabel2: UILabel = {
        let label = UILabel()
        label.text = "ACCIO"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let harryPotterLabel3: UILabel = {
        let label = UILabel()
        label.text = "EXPELLIARMUS"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let harryPotterLabel4: UILabel = {
        let label = UILabel()
        label.text = "AVADA KEDAVRA"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let harryPotterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        addStackViews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(appNameLabel)
        view.addSubview(harryPotterStackView)
        view.addSubview(harryPotterLabel1)
        view.addSubview(harryPotterLabel2)
        view.addSubview(harryPotterLabel3)
        view.addSubview(harryPotterLabel4)
    }
    
    private func addStackViews() {
        harryPotterStackView.addArrangedSubview(harryPotterLabel1)
        harryPotterStackView.addArrangedSubview(harryPotterLabel2)
        harryPotterStackView.addArrangedSubview(harryPotterLabel3)
        harryPotterStackView.addArrangedSubview(harryPotterLabel4)
    }
    
    private func applyConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(60)
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.width.equalTo(200)
        }
        
        harryPotterStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
}

