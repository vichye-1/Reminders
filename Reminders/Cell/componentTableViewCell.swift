//
//  componentTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class ComponentTableViewCell: BaseTableViewCell {

    let componentLabel = {
        let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func configureHierarchy() {
        [componentLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureConstraints() {
        componentLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
        }
    }
}
