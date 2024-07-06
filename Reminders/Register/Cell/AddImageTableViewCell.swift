//
//  AddImageTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/6/24.
//

import UIKit
import SnapKit

class AddImageTableViewCell: BaseTableViewCell {
    
    var titleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var userImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    var chevronImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.forward")
        imageView.tintColor = .gray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [titleLabel, userImageView, chevronImageView].forEach { contentView.addSubview($0) }
    }
    
    override func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
        }
        
        userImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(chevronImageView.snp.leading).offset(-16)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.8)
            make.width.equalTo(userImageView.snp.height).multipliedBy(1.5)
        }
        
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.3)
            make.width.equalTo(chevronImageView.snp.height).multipliedBy(0.5)
        }
    }
    
    func configureTitle(cellTitle: CellType) {
        titleLabel.text = cellTitle.title
    }
}
