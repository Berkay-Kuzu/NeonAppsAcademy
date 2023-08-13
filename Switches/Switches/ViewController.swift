//
//  ViewController.swift
//  Switches
//
//  Created by Berkay Kuzu on 1.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private let colorSwitch : UISwitch = {
        let colorSwitch = UISwitch()
        colorSwitch.isOn = false
        colorSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        colorSwitch.sizeToFit()
        colorSwitch.thumbTintColor = UIColor.black
        return colorSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
    }

    private func addSubviews() {
        view.addSubview(colorSwitch)
    }
    
    private func applyConstraints() {
        colorSwitch.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
    }
    
}

