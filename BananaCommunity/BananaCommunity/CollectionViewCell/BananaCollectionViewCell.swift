//
//  BananaCollectionViewCell.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import SDWebImage

class BananaCollectionViewCell: UICollectionViewCell {
    
    var userID: String?
    
    private weak var navigationController: UINavigationController?
    
    static let identifier = String(describing: BananaCollectionViewCell.self)
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let userComment: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let userCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Comment", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(userCommentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //    private let commentTextView: UITextView = {
    //        let textView = UITextView()
    //        textView.font = UIFont.boldSystemFont(ofSize: 10)
    //        textView.layer.cornerRadius = 8
    //        textView.layer.borderWidth = 1
    //        //        textView.layer.borderColor = UIColor.lightGray.cgColor
    //        textView.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
    //        textView.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Hafif soluk arka plan rengi
    //        textView.isScrollEnabled = true
    //        textView.isHidden = true
    //        return textView
    //    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentview()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentview() {
        contentView.addSubview(usernameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(userComment)
        contentView.addSubview(userCommentButton)
    }
    
    func applyConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
            make.right.left.equalToSuperview()
            make.width.height.equalTo(130)
        }
        userComment.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
        userCommentButton.snp.makeConstraints { make in
            make.top.equalTo(userComment.snp.bottom).offset(5)
            make.left.equalTo(5)
            make.bottom.equalToSuperview().offset(-3)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    func setup(with firebaseData: FirebaseData, navigationController: UINavigationController?) {
        userImageView.sd_setImage(with: URL(string: firebaseData.userImage))
        usernameLabel.text = firebaseData.userName
        userID = firebaseData.id
        userComment.text = firebaseData.userComment
        self.navigationController = navigationController
    }
    
    @objc private func userCommentButtonTapped() {
        guard let navigationController = navigationController else {return}
        print(userID)
        let vc = CommentViewController()
        vc.userID = userID
        vc.hidesBottomBarWhenPushed = true
        //vc.userID = userID
//        navigationController.pushViewController(vc, animated: true)
        UIView.transition(with: navigationController.view, duration: 0.5, options: .transitionFlipFromRight, animations: {
                navigationController.pushViewController(vc, animated: false)
            }, completion: nil)
        
    }
}
