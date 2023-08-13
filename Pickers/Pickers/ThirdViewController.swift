//
//  ThirdViewController.swift
//  Pickers
//
//  Created by Berkay Kuzu on 6.06.2023.
//

import UIKit

class ThirdViewController: UIViewController, UIFontPickerViewControllerDelegate {

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let changeFontButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Font", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.clockwise", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ornare consequat nisl, in finibus enim porta id. Fusce euismod felis justo, ut pharetra diam aliquet nec. Nam blandit, diam ultricies bibendum scelerisque, purus nibh mollis massa, ut rhoncus."
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(_:)), name: Notification.Name("FontChanged"), object: nil)
    }
    
    @objc func fontChanged(_ notification: Notification) {
        if let descriptor = notification.object as? UIFontDescriptor {
                let newFont = UIFont(descriptor: descriptor, size: 20)
                nameLabel.font = newFont
            }
    }
    
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Third Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        view.addSubview(nextButton)
        view.addSubview(nameLabel)
        view.addSubview(changeFontButton)
        
        NotificationCenter.default.addObserver(self, selector: #selector(backgroundColorChanged(_:)), name: Notification.Name("BackgroundColorChanged"), object: nil)
    }
    
    @objc func backgroundColorChanged(_ notification: Notification) {
        if let newBackgroundColor = notification.object as? UIColor {
            view.backgroundColor = newBackgroundColor
        }
    }
    
    private func applyConstraints() {
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        changeFontButton.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(50)
            //make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    
    @objc private func nextButtonTapped() {
        print("Next Button Tapped")
        let controller = ForthViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func changeButtonTapped() {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
        guard let descriptor = viewController.selectedFontDescriptor else {return}
        //nameLabel.font = UIFont(descriptor: descriptor, size: 20)
        NotificationCenter.default.post(name: Notification.Name("FontChanged"), object: descriptor)
    }
   
}
