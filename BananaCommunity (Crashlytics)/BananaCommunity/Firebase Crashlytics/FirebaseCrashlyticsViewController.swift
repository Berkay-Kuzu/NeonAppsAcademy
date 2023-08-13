//
//  FirebaseCrashlyticsViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 24.06.2023.
//

import UIKit
import FirebaseAnalytics
import FirebaseCrashlytics

class FirebaseCrashlyticsViewController: UIViewController {
    
    private let crashButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test Crash", for: [])
        button.addTarget(self, action: #selector(crashButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(crashButton)
    }
    
    private func applyConstraints() {
        crashButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    @objc private func crashButtonTapped() {
        let numbers = [0]
        let _ = numbers[1]
    }
    
}
