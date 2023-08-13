//
//  DetailViewController.swift
//  Table View
//
//  Created by Berkay Kuzu on 8.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let hometownLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let titanicStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .white
        return stackView
    }()
    
        let neonAcademyPerson: NeonAcademyPerson
        
        init(neonAcademyPerson: NeonAcademyPerson) {
            self.neonAcademyPerson = neonAcademyPerson
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        addSubviews()
        addSubviewTitanicStackView()
        applyConstraints()
        textConfigure()
    }
    
    private func textConfigure() {
        nameLabel.text = "\(neonAcademyPerson.name) \(neonAcademyPerson.surname)"
        teamLabel.text = "\(neonAcademyPerson.team)"
        ageLabel.text = "\(neonAcademyPerson.age)"
        hometownLabel.text = "\(neonAcademyPerson.hometown)"
        mailLabel.text = "\(neonAcademyPerson.mail)"
    }
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(teamLabel)
        view.addSubview(ageLabel)
        view.addSubview(hometownLabel)
        view.addSubview(mailLabel)
        view.addSubview(titanicStackView)
    }
    
    private func addSubviewTitanicStackView() {
        titanicStackView.addArrangedSubview(nameLabel)
        titanicStackView.addArrangedSubview(teamLabel)
        titanicStackView.addArrangedSubview(ageLabel)
        titanicStackView.addArrangedSubview(hometownLabel)
        titanicStackView.addArrangedSubview(mailLabel)
    }

    private func applyConstraints() {
        titanicStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
