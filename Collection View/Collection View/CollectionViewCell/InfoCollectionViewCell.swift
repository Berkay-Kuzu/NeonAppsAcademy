//
//  InfoCollectionViewCell.swift
//  Collection View
//
//  Created by Berkay Kuzu on 10.06.2023.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: InfoCollectionViewCell.self)
    
    let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
        }()
    
    
    let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.backgroundColor = .yellow
        return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentview()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentview() {
        contentView.addSubview(infoTitleLabel)
        contentView.addSubview(infoImageView)
                
    }
    
    func applyConstraints() {
        infoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview()
            make.width.height.equalTo(130)
           // make.centerX.equalToSuperview()
        }
        
        infoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().offset(-2)
        }
    }
    
    func setup(_ info: Info) {
        infoImageView.image = info.appIcon
        infoTitleLabel.text = info.appName
    }
}
