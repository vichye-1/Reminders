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
        /*
         var button = UIButton.Configuration.plain()
         button.image = UIImage(systemName: "plus.circle.fill")
         button.baseForegroundColor = .systemBlue
         var attText = AttributedString("새로운 미리 알림")
         attText.font = UIFont.systemFont(ofSize: 16)
         button.attributedTitle = attText
         button.background.cornerRadius = 10
         button.imagePadding = 10
         */
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.setTitle("새로운 미리 알림", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        // button.configuration?.imagePadding = 10
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
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
            make.width.equalTo(view.snp.width).multipliedBy(0.45)
        }
    }
    
    
}
