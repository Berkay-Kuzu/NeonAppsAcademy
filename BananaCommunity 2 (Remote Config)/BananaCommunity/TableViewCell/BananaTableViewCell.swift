//
//  TableViewCell.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 23.06.2023.
//

import UIKit

class BananaTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: BananaTableViewCell.self)
    
     let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.text = "Berkay"
        return label
    }()
    
     let userCommentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.text = "Wonderful!"
        return label
    }()
    
//    let userDateLabel: UILabel = {
//       let label = UILabel()
//       label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//       label.numberOfLines = 0
//       label.textAlignment = .left
//       //label.text = "Wonderful!"
//       return label
//   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(usernameLabel)
        contentView.addSubview(userCommentLabel)
//        contentView.addSubview(userDateLabel)
        applyConstraints()
    }
    
    func setup(with comment: Comment) {
        usernameLabel.text = comment.userName
//        userDateLabel.text = comment.userCommentdate
        userCommentLabel.text = comment.userComment
    
    }
    
    private func applyConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
        userCommentLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
            make.bottom.equalTo(contentView).offset(-5)
        }
        
//        userDateLabel.snp.makeConstraints { make in
//            make.top.equalTo(userCommentLabel.snp.bottom).offset(5)
//            make.leading.equalTo(contentView).offset(5)
//            make.trailing.equalTo(contentView).offset(-5)
//            make.bottom.equalTo(contentView).offset(-5)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
