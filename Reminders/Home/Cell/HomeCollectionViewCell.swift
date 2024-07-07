//
//  HomeCollectionViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/6/24.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    private let iconImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.backgroundColor = .systemMint
        return imageview
    }()
    
    private let componentLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.backgroundColor = .systemYellow
        return label
    }()
    
    override func configureHierarchy() {
        [iconImageView, componentLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(contentView.snp.height).multipliedBy(0.4)
        }
        
        componentLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(contentView).inset(8)
            make.bottom.equalTo(contentView).inset(8)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        contentView.backgroundColor = .brown
    }
}
