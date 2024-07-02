//
//  TitleTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class TitleTableViewCell: BaseTableViewCell {

    let titleTextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textContainerInset = .init(top: 10, left: 8, bottom: 10, right: 8)
        //textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func configureHierarchy() {
        contentView.addSubview(titleTextView)
    }
    
    override func configureConstraints() {
        titleTextView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
