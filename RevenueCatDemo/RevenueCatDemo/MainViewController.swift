//
//  MainViewController.swift
//  RevenueCatDemo
//
//  Created by Berkay Kuzu on 16.06.2023.
//

import UIKit
import Purchases

class MainViewController: UIViewController {
    
    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.text = "Per Month Price $19.99"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        //label.isHidden = true
        return label
    }()
    
    private let paidLabel: UILabel = {
        let label = UILabel()
        label.text = "You already subscribed!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        label.isHidden = true
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "b.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        //button.isHidden = true
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var isPremium = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        purchaserInfo()
    }
    
    private func purchaserInfo() {
        Purchases.shared.purchaserInfo { (purchaserInfo, error) in
            if !(purchaserInfo?.entitlements.active.isEmpty)! {
                self.isPremium = true
                DispatchQueue.main.async {
                    self.subscribeLabel.isHidden = true
                    self.buyButton.isHidden = true
                    self.paidLabel.isHidden = false
                }
            } else {
                self.isPremium = false
            }
        }
        
        print(isPremium)
    }
    
    private func addSubviews() {
        view.addSubview(subscribeLabel)
        view.addSubview(buyButton)
        view.addSubview(paidLabel)
    }
    
    private func applyConstraints() {
        subscribeLabel.snp.makeConstraints { make in
            //make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(subscribeLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        paidLabel.snp.makeConstraints { make in
            //make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerY.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc private func buyButtonTapped() {
        let vc = InAppViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
