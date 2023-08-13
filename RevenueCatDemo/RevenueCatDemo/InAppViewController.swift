//
//  InAppViewController.swift
//  RevenueCatDemo
//
//  Created by Berkay Kuzu on 16.06.2023.
//

import UIKit
import Purchases

class InAppViewController: UIViewController {
    
    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment Completed!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        label.isHidden = true
        return label
    }()
    
    private let purchaseRestoredLabel: UILabel = {
        let label = UILabel()
        label.text = "Purchase is restored!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        label.isHidden = true
        return label
    }()
    
    private let revenueCatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "crown.fill")
        imageView.tintColor = .brown
        return imageView
    }()
    
    private let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Subscribe", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "s.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.isHidden = true
        button.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let restoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Restore Purchase", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "r.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.isHidden = true
        button.addTarget(self, action: #selector(restoreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        setup()
        configureNavBar()
       // checkPremiumSubscription()
        

    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Main Screen", style: .done, target: nil, action: nil)
    }
    
    func setup(){
        Purchases.shared.purchaserInfo { [weak self] info, error in
            guard let info = info, error == nil else {return}
            
            if info.entitlements.all["Premium"]?.isActive == true {
                DispatchQueue.main.async {
                    self?.subscribeLabel.isHidden = false
                    self?.restoreButton.isHidden = false
                }
            } else {
                DispatchQueue.main.async {
                    self?.subscribeButton.isHidden = false
                    self?.restoreButton.isHidden = false
                }
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(subscribeButton)
        view.addSubview(restoreButton)
        view.addSubview(revenueCatImageView)
        view.addSubview(subscribeLabel)
        view.addSubview(purchaseRestoredLabel)
    }
    
    private func applyConstraints() {
        revenueCatImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        subscribeButton.snp.makeConstraints { make in
            make.top.equalTo(revenueCatImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(subscribeButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
        subscribeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(90)
        }
        
        purchaseRestoredLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(90)
        }
    }
    
    func fetchPackage(completion: @escaping (Purchases.Package) -> Void ) {
        Purchases.shared.offerings { offerings, error in
            guard let offerings = offerings, error == nil else {
                return
            }
            guard let package = offerings.all.first?.value.availablePackages.first else {
                return
            }
            completion(package)
        }
    }
    
    func purchase(package: Purchases.Package) {
        Purchases.shared.purchasePackage(package) { [weak self] transaction, info, error, userCancelled in
            guard let transaction = transaction,
                  let info = info,
                  error == nil,
                  !userCancelled else {
                return
            }
            if info.entitlements.all["Premium"]?.isActive == true {
                DispatchQueue.main.async {
                    self?.subscribeLabel.isHidden = true
                    self?.subscribeButton.isHidden  = true
                    self?.restoreButton.isHidden = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    let vc = MainViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self?.makeAlert(titleInput: "Warning!", messageInput: "Your payment has not been made")
                    self?.subscribeButton.isHidden = false
                    self?.restoreButton.isHidden = false
                }
            }
        }
    }
    
//    func checkPremiumSubscription() {
//        if let isPremiumMember = UserDefaults.standard.value(forKey: "isPremiumMember") as? Bool, isPremiumMember {
//            DispatchQueue.main.async {
//                self.subscribeLabel.isHidden = true
//                self.purchaseRestoredLabel.isHidden = false
//                self.restoreButton.isHidden = true
//                self.subscribeButton.isHidden = true
//            }
//        } else {
//            self.subscribeButton.isHidden = false
//            self.restoreButton.isHidden = false
//        }
//    }
    
    func restorePurchases() {

        
        Purchases.shared.restoreTransactions { [weak self] info, error in
            guard let info = info, error == nil else {return}
            print(info)

            if info.entitlements.all["Premium"]?.isActive == true {
                DispatchQueue.main.async {
                    self?.subscribeLabel.isHidden = true
                    self?.purchaseRestoredLabel.isHidden = false
                    self?.restoreButton.isHidden = true
                    self?.subscribeButton.isHidden = true

                }
            } else {
                DispatchQueue.main.async {
                    self?.makeAlert(titleInput: "Premium Membership is not available!", messageInput: "You are not a premium member.")
                    self?.subscribeButton.isHidden = false
                    self?.restoreButton.isHidden = false
                }
            }
        }
    }
    
    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
//    func premiumMembership(isPremium: Bool) {
//        UserDefaults.standard.setValue(isPremium, forKey: "isPremiumMember")
//    }
    
    @objc private func subscribeButtonTapped() {
        //Purchase
        fetchPackage { [weak self] package in
            self?.purchase(package: package)
        }
    }
    
    @objc private func restoreButtonTapped() {
        //Restore
        restorePurchases()

    }
    
}

