//
//  TaskListTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/8/24.
//

import UIKit
import SnapKit

class TaskListTableViewCell: BaseTableViewCell {
    
    private let checkButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.backgroundColor = .systemBlue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .customBackGround
    }
    
    override func configureHierarchy() {
        [checkButton, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.top)
            make.leading.equalTo(checkButton.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
    }
}
