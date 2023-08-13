//
//  ViewController.swift
//  Segmented Control
//
//  Created by Berkay Kuzu on 3.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let dinosaurSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Neon Academy 2023", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Neon", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Apps", at: 2, animated: true)
        //segmentedControl.selectedSegmentIndex = 1
        segmentedControl.layer.cornerRadius = 5
        segmentedControl.clipsToBounds = true
        segmentedControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentTintColor = .white
        let normalAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
        ]
        segmentedControl.setTitleTextAttributes(normalAttributes, for: .selected)
        segmentedControl.subviews[0].backgroundColor = .purple
        segmentedControl.subviews[1].backgroundColor = .yellow
        segmentedControl.subviews[2].backgroundColor = .green
        return segmentedControl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubview()
        applyConstraints()
    }

    
    private func addSubview() {
        view.addSubview(dinosaurSegmentedControl)
    }
    
    private func applyConstraints() {
        dinosaurSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
//            make.left.equalTo(view).offset(20)
//            make.right.equalTo(view).offset(-20)
            make.centerX.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
    }
    
    @objc private func segmentSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            dinosaurSegmentedControl.snp.updateConstraints { make in
                        make.width.equalTo(380)
                    }
            view.backgroundColor = .systemPurple
        } else if sender.selectedSegmentIndex == 1 {
            dinosaurSegmentedControl.snp.updateConstraints { make in
                        make.width.equalTo(250)
                    }
            view.backgroundColor = .systemYellow
        } else if sender.selectedSegmentIndex == 2 {
            dinosaurSegmentedControl.snp.updateConstraints { make in
                        make.width.equalTo(160)
                    }
            view.backgroundColor = .systemGreen
        } else {
            dinosaurSegmentedControl.snp.updateConstraints { make in
                        make.width.equalTo(300)
                    }

        }
        
        
    }









}

