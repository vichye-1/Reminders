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
    
    override func configureHierarchy() {
        [iconImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(contentView.snp.height).multipliedBy(0.5)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
    }
}
