//
//  EurovisionViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 24.06.2023.
//

import UIKit
import FirebaseRemoteConfig

class EurovisionViewController: UIViewController {
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private let eurovisionLabel: UILabel = {
        let label = UILabel()
        label.text = "Eurovision Song Contest 🎤"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemRed
        label.font = .boldSystemFont(ofSize: 25)
        //label.isHidden = true
        return label
    }()
    
    private let eurovisionNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2022"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 25)
        //label.isHidden = true
        return label
    }()
    
    private let eurovisionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "eurovision.png")
        imageView.isHidden = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        fetchValues()
    }
    
    private func fetchValues() {
        let defaults: [String: NSObject] = [
            "isImageHidden": false as NSObject
        ]
        
        remoteConfig.setDefaults(defaults)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        self.eurovisionImageView.isHidden = false // If there is no Internet connection, this will be shown to the users!
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success && error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else {return}
                    let value = self.remoteConfig.configValue(forKey: "isImageHidden").boolValue
                    let isImageHidden = self.remoteConfig["isImageHidden"].boolValue
                    DispatchQueue.main.async {
                        self.eurovisionImageView.isHidden = isImageHidden
                        print("Fetched: \(value)")
                    }
                }
            } else {
                print("Something went wrong")
            }
        }
    }

    
    private func addSubviews() {
        view.addSubview(eurovisionLabel)
        view.addSubview(eurovisionNumberLabel)
        view.addSubview(eurovisionImageView)
    }
    
    private func applyConstraints() {
        eurovisionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        eurovisionNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(eurovisionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        eurovisionImageView.snp.makeConstraints { make in
            make.top.equalTo(eurovisionNumberLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300)
            make.height.equalTo(150)
        }
    }
    
   
}
