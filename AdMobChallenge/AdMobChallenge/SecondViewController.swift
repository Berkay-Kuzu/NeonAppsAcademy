//
//  SecondViewController.swift
//  AdMobChallenge
//
//  Created by Berkay Kuzu on 17.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let addMobLabel: UILabel = {
        let label = UILabel()
        label.text = "You watched the ad!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        //label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(addMobLabel)
    }
    
    private func applyConstraints() {
        addMobLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
    }

}
