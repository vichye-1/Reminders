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
        configureHierarchy()
        configureConstraints()
        configureUI()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureUI() { 
        view.backgroundColor = .white
    }
}
