//
//  BaseViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackGround
        configureHierarchy()
        configureConstraints()
        configureUI()
        configureCollectionView()
        configureTableView()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureUI() { }
    func configureCollectionView() { }
    func configureTableView() { }
}
