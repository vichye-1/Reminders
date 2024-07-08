//
//  TaskListTableViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/8/24.
//

import UIKit
import SnapKit

class TaskListTableViewCell: BaseTableViewCell {
    
    var reminder: ReminderTable?
    var checkButtonHandler: ((Bool) -> Void)?
    
    private let checkButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.systemGray.cgColor
        return button
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let contentLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    private let tagLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .customBackGround
    }
    
    override func configureHierarchy() {
        [checkButton, titleLabel, contentLabel, tagLabel].forEach {
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
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(24)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentLabel)
            make.height.equalTo(24)
        }
    }
    
    override func configureUI() {
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    @objc private func checkButtonTapped() {
        guard var reminder = reminder else { return }
        reminder.isCompleted.toggle()
        updateComplete(isCompleted: reminder.isCompleted)
        checkButtonHandler?(reminder.isCompleted)
    }
    
    private func updateComplete(isCompleted: Bool) {
        if isCompleted {
            checkButton.backgroundColor = .systemGray
            titleLabel.attributedText = titleLabel.text?.strikeThrough()
            contentLabel.attributedText = contentLabel.text?.strikeThrough()
            tagLabel.attributedText = tagLabel.text?.strikeThrough()
        } else {
            checkButton.backgroundColor = .clear
            titleLabel.attributedText = nil
            titleLabel.text = reminder?.reminderTitle
            contentLabel.attributedText = nil
            contentLabel.text = reminder?.content
            tagLabel.attributedText = nil
            tagLabel.text = reminder?.tag
        }
    }
    
    func configureTable(reminder: ReminderTable) {
        self.reminder = reminder
        updateComplete(isCompleted: reminder.isCompleted)
    }
}
