//
//  TableViewCell.swift
//  InfoAppCoreData
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class InfoAppTableViewCell: UITableViewCell {

    static let identifier = String(describing: InfoAppTableViewCell.self)
    
      var nameLabel: UILabel = {
        let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    var surnameLabel: UILabel = {
        let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    var ageLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       return label
   }()
    
    var emailLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       return label
   }()
    
    var othersLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
       label.numberOfLines = 0
       label.textAlignment = .left
       return label
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(surnameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(othersLabel)
        applyConstraints()
    }
    
//    func setup(with comment: Comment) {
//        usernameLabel.text = comment.userName
////        userDateLabel.text = comment.userCommentdate
//        userCommentLabel.text = comment.userComment
//
//    }
//
    private func applyConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
        othersLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(5)
            make.trailing.equalTo(contentView).offset(-5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
