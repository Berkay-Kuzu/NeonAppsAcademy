//
//  DetailViewController.swift
//  Collection View
//
//  Created by Berkay Kuzu on 10.06.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let appCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let appleStoreURLLabel: UILabel = {
        let label = UILabel()
        label.text = "Go to App Store"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .white
        return stackView
    }()
    
    var info: Info
    
    init(info: Info) {
        self.info = info
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureNavBar()
        tapGesture()
        //configData()
        addSubviews()
        applyConstraints()
        viewConfigure()
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to First Page", style: .done, target: nil, action: nil)
        title = "App Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(linkLabelTapped))
        appleStoreURLLabel.isUserInteractionEnabled = true
        appleStoreURLLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func linkLabelTapped() {
        
        let url = info.appStoreURL
        if let url = url {
            UIApplication.shared.open(url)
            print(url)
        }
    }
    
    private func viewConfigure() {
        appIconImageView.image = info.appIcon
        appNameLabel.text = "\(info.appName)"
        appCategoryLabel.text = "\(info.appCategory)"
        releaseDateLabel.text = "\(info.releaseDate)"
        appleStoreURLLabel.text = "Go to App Store"
    }
    
    private func addSubviews() {
        view.addSubview(appIconImageView)
        view.addSubview(appNameLabel)
        view.addSubview(appCategoryLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(appleStoreURLLabel)
        
    }
    
    private func applyConstraints() {
        
        appIconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.width.height.equalTo(300)
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        appCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(appCategoryLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        appleStoreURLLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
}


