//
//  SecondViewController.swift
//  LottieLibraryAnimation
//
//  Created by Berkay Kuzu on 12.06.2023.
//

import UIKit
import Lottie

class SecondViewController: UIViewController {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "user1")
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    
    private let lottieAnimationView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "45511-blur-01")
        animationView.contentMode = .scaleAspectFit
        //animationView.animationSpeed = 1
        animationView.loopMode = .loop
        return animationView
    }()
    
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resumeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Resume", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        //setupAnimation()
    

    }
    
//    private func setupAnimation() {
//        animationView.contentMode = .scaleAspectFit
//        //animationView.animationSpeed = 1
//        animationView.loopMode = .loop
//        view.addSubview(animationView)
//    }
    
    
    @objc private func playButtonTapped() {
        lottieAnimationView.play()

    }
    
    @objc private func stopButtonTapped() {
        lottieAnimationView.pause()
    }
    
    @objc private func resumeButtonTapped() {
        lottieAnimationView.play()
    }

    private func addSubviews() {
        view.addSubview(iconImageView)
        view.addSubview(playButton)
        view.addSubview(lottieAnimationView)
        view.addSubview(stopButton)
        view.addSubview(resumeButton)
       
    }
    
    private func applyConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.width.height.equalTo(200)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        stopButton.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        resumeButton.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        lottieAnimationView.snp.makeConstraints { make in
            make.edges.equalTo(iconImageView)
        }
    }
}
