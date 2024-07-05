//
//  componentTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class ComponentTableViewCell: BaseTableViewCell {
    
    var delegate: PassDueDateDelegate?
    
    var titleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var valueLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        //label.text = "test"
        label.textAlignment = .right
        return label
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
        [titleLabel, valueLabel, chevronImageView].forEach { contentView.addSubview($0) }
    }
    
    override func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(chevronImageView.snp.leading).offset(-16)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(16)
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
