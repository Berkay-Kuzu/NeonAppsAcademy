//
//  SecondViewController.swift
//  Pickers
//
//  Created by Berkay Kuzu on 6.06.2023.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
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

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "click1.png")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
        gestureRecognizer()
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Second Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        view.addSubview(nextButton)
        view.addSubview(iconImageView)
    }
    
    private func applyConstraints() {
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
    private func gestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        iconImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                iconImageView.image = pickedImage
                dismiss(animated: true, completion: nil)
                
                NotificationCenter.default.post(name: Notification.Name("ProfilePhotoChanged"), object: pickedImage)
            }
        }
    // Notification.Name("ProfilePhotoChanged")
    
    @objc private func nextButtonTapped() {
        print("Next Button Tapped")
        let controller = ThirdViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
            
    }

}
