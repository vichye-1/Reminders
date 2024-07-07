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
        let uiColor = UIColor(red: 243 / 255, green: 242 / 255, blue: 247 / 255, alpha: 1.0)
        view.backgroundColor = uiColor
        configureHierarchy()
        configureConstraints()
        configureUI()
        configureCollectionView()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureUI() { }
    func configureCollectionView() { }
}
