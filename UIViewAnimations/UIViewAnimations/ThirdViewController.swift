//
//  ThirdViewController.swift
//  UIViewAnimations
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let vikingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Vikings"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 25)
        //label.isHidden = true
        return label
    }()
    
    private let upButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Up", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Down", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(vikingsLabel)
        view.addSubview(upButton)
        view.addSubview(downButton)
    }
    
    private func applyConstraints() {
        
        vikingsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        upButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(vikingsLabel.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        downButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(upButton.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    @objc private func upButtonTapped() {
        UIView.animate(withDuration: 0.3) {
                    self.vikingsLabel.center.y -= 50
                }
    }
    
    @objc private func downButtonTapped() {
        UIView.animate(withDuration: 0.3) {
                    self.vikingsLabel.center.y += 50
                }
    }
    
    
}

