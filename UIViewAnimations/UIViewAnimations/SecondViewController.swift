//
//  SecondViewController.swift
//  UIViewAnimations
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    var currentRotation: CGFloat = 0.0
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "vikings.jpeg")
        return imageView
    }()
    
    private let rotateRightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Right", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(rotateRightButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let rotateLeftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Left", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(rotateLeftButtonTapped), for: .touchUpInside)
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
        view.addSubview(imageView)
        view.addSubview(rotateLeftButton)
        view.addSubview(rotateRightButton)
    }
    
    private func applyConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            
        }
        
        rotateLeftButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        rotateRightButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-32)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
    
    @objc private func rotateLeftButtonTapped() {
        currentRotation -= .pi / 4 // Rotate 45 degrees (left)
        rotateImageView()
    }
    
    @objc private func rotateRightButtonTapped() {
        currentRotation += .pi / 4 // Rotate 45 degrees (right)
        rotateImageView()
    }
    
    func rotateImageView() {
            UIView.animate(withDuration: 0.3) {
                self.imageView.transform = CGAffineTransform(rotationAngle: self.currentRotation)
            }
        }
    


}
