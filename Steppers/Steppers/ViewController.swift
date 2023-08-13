//
//  ViewController.swift
//  Steppers
//
//  Created by Berkay Kuzu on 1.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let babyDollStepper : UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.stepValue = 5
        stepper.backgroundColor = .systemPink
        stepper.tintColor = .blue
        stepper.setDividerImage(UIImage(systemName: "line.diagonal"), forLeftSegmentState: .normal, rightSegmentState: .normal)
        let incrementImage = UIImage(systemName: "balloon.2.fill")
        let decrementImage = UIImage(systemName: "balloon.fill")
        stepper.setIncrementImage(incrementImage, for: .normal)
        stepper.setDecrementImage(decrementImage, for: .normal)
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        return stepper
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Baby Doll Stepper"
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let babyDollLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        babyDollLabel.text = "Total number of outfit: \(Int(babyDollStepper.value))"
    }

    private func addSubviews() {
        view.addSubview(babyDollStepper)
        view.addSubview(titleLabel)
        view.addSubview(babyDollLabel)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
        
        babyDollStepper.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
        }
        
        babyDollLabel.snp.makeConstraints { make in
            make.top.equalTo(babyDollStepper.snp.bottom).offset(50)
            make.centerX.equalTo(view)
        }
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        babyDollLabel.text = "Total number of outfit: \(Int(value))"
    }
}

