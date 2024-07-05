//
//  ViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    let newReminderButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "새로운 할 일"
        configuration.image = UIImage(systemName: "plus.circle.fill")
        configuration.imagePadding = 4
        configuration.baseForegroundColor = .systemBlue
        button.contentHorizontalAlignment = .leading
        button.configuration = configuration
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newReminderButton.addTarget(self, action: #selector(newReminderButtonClicked), for: .touchUpInside)
    }
    
    @objc
    private func newReminderButtonClicked() {
        let nextVC = RegisterViewController()
        let navController = UINavigationController(rootViewController: nextVC)
        present(navController, animated: true)
    }
    
    override func configureHierarchy() {
        [newReminderButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        newReminderButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
            make.width.equalTo(view.snp.width).multipliedBy(0.45)
        }
    }
}
