//
//  Extension.swift
//  Background
//
//  Created by Berkay Kuzu on 26.05.2023.
//

import UIKit

extension UIViewController {
    func changeUIViewControllerBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
}

extension UILabel {
    func changeLabelText(text: String) {
        self.text = text
    }
}

extension UIImageView {
    func changeUIImageView(named: String) {
        image = UIImage(named: named)
    }
}

extension UIButton {
    func changeButtonText(text: String, state: UIControl.State) {
        setTitle(text, for: state)
    }
}
