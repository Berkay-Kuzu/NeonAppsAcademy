//
//  ViewController.swift
//  FutureTech
//
//  Created by Berkay Kuzu on 30.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let iconImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "FutureTech 🚀"
        label.font = UIFont.systemFont(ofSize: 40)
        label.backgroundColor = .orange
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private let turnOnLabel: UILabel = {
        let label = UILabel()
        label.text = "Please tap a button to interact with your device!"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0 // Label can take multiple lines.
        return label
    }()
    
    private let connectedDeviceLabel: UILabel = {
        let label = UILabel()
        label.text = "Your connected device is Smart TV 🖥️"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0 // Label can take multiple lines.
        return label
    }()
    
    private let currentDateLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "tv.jpg")
        return imageView
    }()
    
    private let turnOnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Turn on", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        let image = UIImage(systemName: "lock.open.display", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let turnOffButton: UIButton = {
        let button = UIButton()
        button.setTitle("Turn off", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        let image = UIImage(systemName: "lock.display", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(turnOffbuttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let accessButton: UIButton = {
        let button = UIButton()
        button.setTitle("Access", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        let image = UIImage(systemName: "gear", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(accessButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubview()
        applyConstraints()
        setupDateFormatter()
        addImageStackView()
        addButtonStackView()
    }
    
    func setupDateFormatter() {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_EN")
            dateFormatter.dateFormat = "d MMMM yyyy EEEE"
            let dateString = dateFormatter.string(from: Date())

        currentDateLabel.text = dateString
    }
    
    private func addSubview() {
        view.addSubview(appNameLabel)
        view.addSubview(currentDateLabel)
        view.addSubview(iconImageView)
        view.addSubview(iconImageStackView)
        view.addSubview(turnOnLabel)
        view.addSubview(turnOnButton)
        view.addSubview(turnOffButton)
        view.addSubview(buttonStackView)
        view.addSubview(connectedDeviceLabel)
    }
    
    private func addImageStackView() {
        iconImageStackView.addArrangedSubview(iconImageView)
    }
    
    private func addButtonStackView() {
        buttonStackView.addArrangedSubview(turnOnButton)
        buttonStackView.addArrangedSubview(turnOffButton)
        buttonStackView.addArrangedSubview(accessButton)
    }
    
    private func applyConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(250)
        }
        
        currentDateLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp_bottomMargin).offset(20)
            make.centerX.equalTo(view)
        }
        
        iconImageStackView.snp.makeConstraints { make in
            make.top.equalTo(currentDateLabel.snp_bottomMargin).offset(20)
            make.centerX.equalTo(view)
        }
        turnOnLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageStackView.snp_bottomMargin).offset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(20)
        }
        
        turnOffButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(50)
            
        }
        
        turnOnButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(50)
            
        }
        accessButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(50)
            
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(turnOnLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(view).offset(20)
            make.width.equalTo(200)
        }
        connectedDeviceLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp_bottomMargin).offset(20)
            make.centerX.equalTo(view)
        }
        
        
    }
    
    @objc private func buttonTapped() {
        turnOnLabel.text = "Your device is turned on!"
        turnOnLabel.textColor = .systemGreen
       //turnOnLabel.isHidden = false
    }
    
    @objc private func turnOffbuttonTapped() {
        turnOnLabel.text = "Your device is turned off!"
        turnOnLabel.textColor = .systemRed
        //turnOnLabel.isHidden = false
    }
    
    @objc private func accessButtonTapped() {
        turnOnLabel.text = "You have device access now."
        turnOnLabel.textColor = .orange
        //turnOnLabel.isHidden = false
    }
}

