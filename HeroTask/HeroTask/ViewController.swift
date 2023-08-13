//
//  ViewController.swift
//  HeroTask
//
//  Created by Berkay Kuzu on 13.06.2023.
//

import UIKit
import Hero

class ViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the maze. If you succeed, you are ready for the real world!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        //label.backgroundColor = .orange
        label.textColor = .black
        //label.layer.cornerRadius = 5
        //label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemOrange
        addSubviews()
        applyConstraints()
    }
    
    @objc private func nextButtonTapped() {
        let secondVC = SecondViewController()
        navigationController?.hero.isEnabled = true
        navigationController?.hero.navigationAnimationType = .zoom
        navigationController?.pushViewController(secondVC, animated: true)
        print("nextButtonTapped")
    }
    
    private func addSubviews() {
        view.addSubview(nextButton)
        view.addSubview(appNameLabel)
    }
    
    private func applyConstraints() {
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        appNameLabel.snp.makeConstraints { make in
            //make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.trailing.equalTo(-10)
            make.leading.equalTo(10)
        }
        
    }
    
}
