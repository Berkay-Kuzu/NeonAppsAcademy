//
//  ViewController.swift
//  Background
//
//  Created by Berkay Kuzu on 26.05.2023.
//

// MARK: - For UIViewController, UILabel, UIImageView and UIButton, They added a function to easily change the background color, text, and image respectively, making it much more convenient for the kingdom's designers and developers to create beautiful and engaging user interfaces.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeUIViewControllerBackgroundColor(color: .blue)
        
        let imageView = UIImageView()
            imageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
            imageView.changeUIImageView(named: "myImage")
        
        view.addSubview(imageView)
        
        let button = UIButton()
            button.changeButtonText(text: "Dynamic", state: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.frame = CGRect(x: 100, y: 300, width: 100, height: 50)
            
        view.addSubview(button)
        
        let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            label.changeLabelText(text: "Berkay Kuzu")
            label.frame = CGRect(x: 100, y: 170, width: 200, height: 200)
           
        view.addSubview(label)
    }
    
}


