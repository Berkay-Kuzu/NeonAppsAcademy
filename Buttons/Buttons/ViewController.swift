//
//  ViewController.swift
//  Buttons
//
//  Created by Berkay Kuzu on 31.05.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let dropdownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select an option", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Options", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "option", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(optionsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let dailySpecialsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Daily Specials", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.blue.cgColor
        button.backgroundColor = .red
        button.alpha = 0.5
        let image = UIImage(systemName: "cup.and.saucer.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let backgroundButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Background", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "balloon.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .purple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backgroundButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let enableButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enable", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "e.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enableButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let disableButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Disabled", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        let image = UIImage(systemName: "d.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    let shakeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Shake", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "scribble", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(shakeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let dropdownStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.isHidden = true
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        addDropDownButtonsStackView()
    }
    
    private func addSubviews() {
        view.addSubview(dropdownButton)
        view.addSubview(dropdownStackView)
        view.addSubview(dailySpecialsButton)
        view.addSubview(optionsButton)
        view.addSubview(backgroundButton)
        view.addSubview(enableButton)
        view.addSubview(disableButton)
        view.addSubview(shakeButton)
    }
    
    private func applyConstraints() {
        dropdownButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
        dropdownStackView.snp.makeConstraints { make in
            make.centerX.equalTo(dropdownButton.snp.centerX)
            make.top.equalTo(dropdownButton.snp.bottom).offset(20)
        }
        dailySpecialsButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
        optionsButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
        backgroundButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
        
        enableButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
        
        disableButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
        shakeButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
        }
    }
    
    private func addDropDownButtonsStackView() {
        dropdownStackView.addArrangedSubview(optionsButton)
        dropdownStackView.addArrangedSubview(dailySpecialsButton)
        dropdownStackView.addArrangedSubview(backgroundButton)
        dropdownStackView.addArrangedSubview(enableButton)
        dropdownStackView.addArrangedSubview(disableButton)
        dropdownStackView.addArrangedSubview(shakeButton)
    }
    
    @objc func dropdownButtonTapped() {
        dropdownStackView.isHidden.toggle()
    }
    
    @objc func enableButtonTapped() {
        disableButton.isEnabled = !disableButton.isEnabled
    }
    
    @objc func backgroundButtonTapped() {
        UIView.animate(withDuration: 0.1, animations: {
                    self.backgroundButton.backgroundColor = .yellow
                }) { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.backgroundButton.backgroundColor = .darkGray
                    })
                }
    }
    
    @objc private func shakeButtonTapped() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: shakeButton.center.x - 10, y: shakeButton.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: shakeButton.center.x + 10, y: shakeButton.center.y))
        shakeButton.layer.add(animation, forKey: "position")
        playSound()
    }
    
    private func playSound() {
            
            guard let url = Bundle.main.url(forResource: "shake", withExtension: "mp3") else { return }
            
            do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                guard let player = player else { return }
                
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    
    @objc func optionsButtonTapped(sender: UIButton) {
        print("Button tapped!")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Option 1", style: .default) { _ in
            print("Option 1 selected")
        }
        
        let action2 = UIAlertAction(title: "Option 2", style: .default) { _ in
            print("Option 2 selected")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Action sheet cancelled")
        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = scene.windows.first?.rootViewController {
            rootViewController.present(actionSheet, animated: true, completion: nil)
        }
        
    }
    
}
