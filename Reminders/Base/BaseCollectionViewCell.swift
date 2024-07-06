//
//  BaseCollectionViewCell.swift
//  Reminders
//
//  Created by 양승혜 on 7/7/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
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
