//
//  BaseTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureConstraints()
        configureUI()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureUI() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
