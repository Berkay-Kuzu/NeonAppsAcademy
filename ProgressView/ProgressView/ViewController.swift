//
//  ViewController.swift
//  ProgressView
//
//  Created by Berkay Kuzu on 4.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Float = 0

    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "The Progress View Journey of Aladdin"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let aladdinProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .black
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
    
    private let progressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Progress", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(progressButtonTapped), for: .touchUpInside)
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
        view.addSubview(aladdinProgressView)
        view.addSubview(progressButton)
    }
    
    private func applyConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.width.equalTo(200)
        }
        
        aladdinProgressView.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(300)
        }
        progressButton.snp.makeConstraints { make in
            make.top.equalTo(aladdinProgressView.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(45)
        }
    }
    
    @objc private func progressButtonTapped() {
        currentValue += 1
        
        if currentValue > 10 {
            currentValue = 0
        }
        let progressBar = currentValue / 10.0
        aladdinProgressView.setProgress(progressBar, animated: true)
    }

}

