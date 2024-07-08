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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .customBackGround
    }
    
    override func configureHierarchy() {
        [checkButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
}
