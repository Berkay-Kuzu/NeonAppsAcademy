//
//  ViewController.swift
//  Activity Indicators
//
//  Created by Berkay Kuzu on 4.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentCount = 0
    var timer: Timer?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .red
        return activityIndicator
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Activity Indicator Challenge"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let countButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Count", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(countButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
    }
    
    
    private func addSubviews() {
        view.addSubview(appNameLabel)
        view.addSubview(countButton)
        view.addSubview(countLabel)
        view.addSubview(activityIndicator)
    }
    
    private func applyConstraints() {
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(80)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            //make.centerX.equalTo(view)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        countButton.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
    }
    
    @objc private func countButtonTapped() {
        activityIndicator.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCount), userInfo: nil, repeats: true)
    }
    
    @objc func updateCount() {
        if currentCount <= 100 {
            countLabel.text = "\(currentCount)"
            currentCount += 1
            
            if currentCount % 10 == 0 {
                let hue = CGFloat(currentCount) / 100.0
                let color = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                activityIndicator.color = color
            }
        } else {
            timer?.invalidate()
            timer = nil
            activityIndicator.stopAnimating()
            countLabel.text = "Well Done!"
        }
    }
}


