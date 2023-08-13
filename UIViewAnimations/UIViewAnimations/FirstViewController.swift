//
//  FirstViewController.swift
//  UIViewAnimations
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let uıView: UIView = {
        let uıView = UIView()
        uıView.backgroundColor = UIColor.red
        return uıView
    }()
    
    private let hideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hide", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(hideButton)
        view.addSubview(showButton)
        view.addSubview(uıView)
    }
    
    private func applyConstraints() {
        
        uıView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(400)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.height.equalTo(50)
            make.width.width.equalTo(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        showButton.snp.makeConstraints { make in
            make.right.equalTo(-50)
            make.height.equalTo(50)
            make.width.width.equalTo(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
    
    @objc private func hideButtonTapped() {
        UIView.animate(withDuration: 0.5) {
            self.uıView.alpha = 0.0
        } completion: { _ in
            self.uıView.isHidden = true
        }
    }
    
    @objc private func showButtonTapped() {
        self.uıView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.uıView.alpha = 1.0
        }
    }
    
    
}

