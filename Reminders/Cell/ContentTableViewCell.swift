//
//  ContentTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class ContentTableViewCell: BaseTableViewCell {

    let contentTextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textContainerInset = .init(top: 15, left: 8, bottom: 0, right: 8)
        textView.text = "메모"
        //textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func configureHierarchy() {
        contentView.addSubview(contentTextView)
    }
    
    override func configureConstraints() {
        contentTextView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
