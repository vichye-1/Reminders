//
//  TitleTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class TitleTableViewCell: BaseTableViewCell {

    let titleTextField = {
        let textField = UITextField()
        textField.placeholder = CellType.title.title
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func configureHierarchy() {
        contentView.addSubview(titleTextField)
    }
    
    override func configureConstraints() {
        titleTextField.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
