//
//  ForthViewController.swift
//  Pickers
//
//  Created by Berkay Kuzu on 6.06.2023.
//

import UIKit

class ForthViewController: UIViewController {
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .black
        return datePicker
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Your Age"
        textField.textColor = .red
        textField.isUserInteractionEnabled = false
        textField.font = UIFont.boldSystemFont(ofSize: 16)
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()

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
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate your age", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrowtriangle.up.square", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
        ageTextField.inputView = datePicker
        
        NotificationCenter.default.addObserver(self, selector: #selector(backgroundColorChanged(_:)), name: Notification.Name("BackgroundColorChanged"), object: nil)
    }
    
    @objc func backgroundColorChanged(_ notification: Notification) {
        if let newBackgroundColor = notification.object as? UIColor {
            view.backgroundColor = newBackgroundColor
        }
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Forth Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        view.addSubview(nextButton)
        view.addSubview(submitButton)
        view.addSubview(ageTextField)
        view.addSubview(datePicker)
    }
    
    private func applyConstraints() {
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
            
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-50.0)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(50)
        }
        
        submitButton.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(50)
        }
    }
    
    @objc private func nextButtonTapped() {
        print("Next Button Tapped")
        let controller = FifthViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func submitButtonTapped() {
        print("Submit Button Tapped")
        let selectedDate = datePicker.date
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: selectedDate, to: Date())
        let age = ageComponents.year ?? 0
        ageTextField.text = String(age)
        NotificationCenter.default.post(name: Notification.Name("AgeChanged"), object: [age as Any?])
    }
}
