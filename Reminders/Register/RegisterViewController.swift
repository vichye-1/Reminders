//
//  RegisterViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import SnapKit

class RegisterViewController: BaseViewController {
    
    let navigationBar = {
        let navigationBar = UINavigationBar()
        return navigationBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHierarchy() {
        [navigationBar].forEach { view.addSubview($0) }
    }
    
    override func configureConstraints() {
        navigationBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureUI() {
        let navItem = UINavigationItem(title: "새로운 할 일")
        let leftButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(leftBarButtonClicked))
        let rightButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navItem.rightBarButtonItem = rightButton
        navItem.leftBarButtonItem = leftButton
        navigationBar.setItems([navItem], animated: true)
        // navigationBar 구분선 투명하게 설정
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    @objc
    private func leftBarButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc
    private func rightBarButtonClicked() {
        
    }
}
