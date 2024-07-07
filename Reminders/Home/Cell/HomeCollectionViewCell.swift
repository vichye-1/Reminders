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
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .systemYellow
        label.text = "오늘"
        return label
    }()
    
    private let countLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "8"
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        return label
    }()
    
    override func configureHierarchy() {
        [iconImageView, componentLabel, countLabel].forEach {
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
        
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.width.height.equalTo(iconImageView.snp.width)
        }
    }
    
    override func configureUI() {
        DispatchQueue.main.async {
            self.iconImageView.layer.cornerRadius = self.iconImageView.frame.width / 2
        }
        contentView.backgroundColor = .brown
    }
}
