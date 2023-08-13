//
//  FifthViewController.swift
//  Pickers
//
//  Created by Berkay Kuzu on 6.06.2023.
//

import UIKit

class FifthViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
//    let colorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
    
    let colorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Color", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "c.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        return button
    }()
    
//     private let homePageButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Back to Home Page", for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.backgroundColor = .black
//        button.setTitleColor(.white, for: .normal)
//        let image = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Fifth Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        //view.addSubview(homePageButton)
        view.addSubview(colorButton)
        //view.addSubview(colorView)
    }
    
    private func applyConstraints() {
        
//        colorView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//            make.width.equalTo(200)
//            make.height.equalTo(200)
//                }
        
        colorButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
    
//        homePageButton.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(250)
//            make.height.equalTo(50)
//        }
    }
    
    @objc private func nextButtonTapped() {
        print("Next Button Tapped")
        let controller = ViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func colorButtonTapped() {
        
        NotificationCenter.default.post(name: Notification.Name("colorChanged"), object: nil)
        print("Color Change Button Tapped")
        let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            present(colorPicker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            let selectedColor = viewController.selectedColor
            view.backgroundColor = selectedColor
        }

        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            let selectedColor = viewController.selectedColor
            view.backgroundColor = selectedColor
            
            NotificationCenter.default.post(name: Notification.Name("BackgroundColorChanged"), object: selectedColor)
        }
}
