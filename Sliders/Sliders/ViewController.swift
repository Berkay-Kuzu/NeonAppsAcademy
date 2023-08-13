//
//  ViewController.swift
//  Sliders
//
//  Created by Berkay Kuzu on 1.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "greenDragon.png")
        return imageView
    }()
    
    private let iconImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "redDragon.png")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rescue Mission"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "0"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let dragonSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addImageStackView()
        applyConstraints()
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(dragonSlider.value)
        valueLabel.text = String(sliderValue)
        
        if sliderValue >= 50 {
            iconImageView.image = UIImage(named: "redDragon")
            iconImageView1.image = UIImage(named: "redDragon")
        } else {
            iconImageView.image = UIImage(named: "greenDragon")
            iconImageView1.image = UIImage(named: "greenDragon")
        }
    }
    
    private func addImageStackView() {
        imageStackView.addArrangedSubview(iconImageView)
        imageStackView.addArrangedSubview(iconImageView1)
    }

    
    private func addSubviews() {
        view.addSubview(dragonSlider)
        view.addSubview(titleLabel)
        view.addSubview(iconImageView)
        view.addSubview(iconImageView1)
        view.addSubview(imageStackView)
        view.addSubview(valueLabel)
    }

    private func applyConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.centerX.equalTo(view)
        }
        
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(70)
            make.height.width.equalTo(300)
            make.centerX.equalTo(view)
        }
    
        dragonSlider.snp.makeConstraints { make in
            make.top.equalTo(imageStackView.snp.bottom).offset(100)
            make.right.equalTo(imageStackView.snp.right)
            make.left.equalTo(imageStackView.snp.left)
            make.centerX.equalTo(view)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(dragonSlider).offset(70)
            make.centerX.equalTo(view)
        }
    
    }
    
}

