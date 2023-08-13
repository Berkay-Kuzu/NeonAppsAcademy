//
//  FourthViewController.swift
//  UIViewAnimations
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class FourthViewController: UIViewController {
    
    var currentSize: CGSize!
    
    private let uıView: UIView = {
        let uıView = UIView()
        uıView.backgroundColor = .systemOrange
        return uıView
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Increase", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Decrease", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        
        currentSize = uıView.frame.size
        
    }
    
    private func addSubviews(){
        view.addSubview(uıView)
        view.addSubview(increaseButton)
        view.addSubview(decreaseButton)
    }
    
    private func applyConstraints() {
        uıView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        increaseButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        decreaseButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-32)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
    
    @objc private func increaseButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.uıView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    @objc private func decreaseButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.uıView.transform = CGAffineTransform.identity
        }
    }
    
    
    
    
}
