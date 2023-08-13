//
//  SlideCollectionViewCell.swift
//  Page Control
//
//  Created by Berkay Kuzu on 2.06.2023.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SlideCollectionViewCell.self)
    
    let slideTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
        }()
    
    let slideSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        }()
    
    let slideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //imageView.backgroundColor = .yellow
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
        contentView.addSubview(slideTitleLabel)
        contentView.addSubview(slideSubtitleLabel)
        contentView.addSubview(slideImageView)
                
    }
    
    func applyConstraints() {
        slideImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview()
            //make.width.height.equalTo(200)
           // make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-180)
        }
        
        slideTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(slideImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        slideSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(slideTitleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    func setup(_ slide: Slide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideSubtitleLabel.text = slide.subtitle
    }
}
