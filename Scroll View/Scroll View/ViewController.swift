//
//  ViewController.swift
//  Scroll View
//
//  Created by Berkay Kuzu on 5.06.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Iron Man's Scrollview Rescue"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel1: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 1"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel2: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 2"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel3: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 3"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel4: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 4"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel5: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 5"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel6: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 6"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel7: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 7"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManLabel8: UILabel = {
        let label = UILabel()
        label.text = "Iron Man Label 8"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ironManScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.backgroundColor = .green
        return scrollView
    }()
    
    private let ironManContentView: UIView = {
        let contentView = UIView()
        //contentView.backgroundColor = .red
        return contentView
    }()
    
    private let ironManTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        //stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private let ironManBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        //stackView.backgroundColor = .brown
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        addIronManScrollView()
        addIronManTopStackView()
        addIronManBottomStackView()
        applyConstraints()
        addContentView()
        
        ironManScrollView.delegate = self
    }


    private func addSubviews() {
        view.addSubview(appNameLabel)
        view.addSubview(ironManScrollView)
        view.addSubview(ironManTopStackView)
        view.addSubview(ironManBottomStackView)
        view.addSubview(ironManLabel1)
        view.addSubview(ironManLabel2)
        view.addSubview(ironManLabel3)
        view.addSubview(ironManLabel4)
        view.addSubview(ironManLabel5)
        view.addSubview(ironManLabel6)
        view.addSubview(ironManLabel7)
        view.addSubview(ironManLabel8)
    }
    
    private func addIronManScrollView() {
        ironManScrollView.addSubview(ironManContentView)
        ironManScrollView.addSubview(ironManTopStackView)
        ironManScrollView.addSubview(ironManBottomStackView)
    }
    
    private func addIronManTopStackView() {
        ironManTopStackView.addArrangedSubview(ironManLabel1)
        ironManTopStackView.addArrangedSubview(ironManLabel2)
        ironManTopStackView.addArrangedSubview(ironManLabel3)
        ironManTopStackView.addArrangedSubview(ironManLabel4)
    }
    
    private func addIronManBottomStackView() {
        ironManBottomStackView.addArrangedSubview(ironManLabel5)
        ironManBottomStackView.addArrangedSubview(ironManLabel6)
        ironManBottomStackView.addArrangedSubview(ironManLabel7)
        ironManBottomStackView.addArrangedSubview(ironManLabel8)
    }
    
    private func addContentView(){
        ironManContentView.addSubview(ironManTopStackView)
        ironManContentView.addSubview(ironManBottomStackView)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let contentOffsetY = scrollView.contentOffset.y
            let scrollViewHeight = scrollView.bounds.height
            let contentHeight = scrollView.contentSize.height

            if contentOffsetY + scrollViewHeight >= contentHeight {
                makeAlert(titleInput: "End of Scroll View", messageInput: "You have reached the end of the scroll view")
            }
        }
    
    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func applyConstraints() {
        appNameLabel.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            //make.top.equalTo(view).offset(60)
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.width.equalTo(200)
        }
        
        ironManScrollView.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
        ironManContentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(ironManScrollView)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(2) // Twice the height of the scroll view
            
        }
        
        ironManTopStackView.snp.makeConstraints { make in
            make.top.equalTo(ironManContentView.snp.top).offset(10)
            make.centerX.equalTo(ironManContentView)
//            make.height.equalTo(300)
//            make.width.equalTo(500)
        }
        
        ironManBottomStackView.snp.makeConstraints { make in
            make.bottom.equalTo(ironManContentView.snp.bottom).offset(-10)
            make.centerX.equalTo(ironManContentView)
           
        }
        
    }
}

