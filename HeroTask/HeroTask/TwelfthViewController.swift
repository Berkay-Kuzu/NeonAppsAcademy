//
//  TwefthViewController.swift
//  HeroTask
//
//  Created by Berkay Kuzu on 14.06.2023.
//

import UIKit

class TwefthViewController: UIViewController {

    private let mazeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "maze.jpg")
        return imageView
    }()
    
    private let manImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "man.jpg")
        return imageView
    }()
    
    private let upButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Up", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Down", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Right", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        return button
    }()

    private let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Left", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        addSubviews()
        applyConstraints()
        configureNavBar()
    }
    
    @objc private func upButtonTapped() {
        makeAlert(titleInput: "Congratulations!", messageInput: "Congratulations, you did it!")
    }
    
    @objc private func downButtonTapped() {
        makeAlert(titleInput: "Try Again!", messageInput: "You're trapped, try again!")
    }
    
    @objc private func rightButtonTapped() {
        makeAlert(titleInput: "Try Again!", messageInput: "You're trapped, try again!")
    }
    
    @objc private func leftButtonTapped() {
        makeAlert(titleInput: "Try Again!", messageInput: "You're trapped, try again!")
    }
    
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to First Page", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func addSubviews() {
        view.addSubview(mazeImageView)
        view.addSubview(manImageView)
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(rightButton)
        view.addSubview(leftButton)
        mazeImageView.addSubview(manImageView)
    }
    
    private func applyConstraints() {
        mazeImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.width.height.equalTo(300)
        }
        manImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(280)
            make.width.height.equalTo(30)
        }
        
        upButton.snp.makeConstraints { make in
            make.top.equalTo(mazeImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        downButton.snp.makeConstraints { make in
            make.top.equalTo(upButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(upButton.snp.bottom).offset(2)
            make.right.equalToSuperview().offset(-25)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(upButton.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let homePageAction = UIAlertAction(title: "Home Page", style: .default) { _ in
            let vc = ViewController()
            self.navigationController?.hero.isEnabled = true
            self.navigationController?.hero.navigationAnimationType = .cover(direction: .down)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            let secondVC = SecondViewController()
            self.navigationController?.hero.isEnabled = true
            self.navigationController?.hero.navigationAnimationType = .cover(direction: .right)
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        alert.addAction(homePageAction)
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    
    }
}
