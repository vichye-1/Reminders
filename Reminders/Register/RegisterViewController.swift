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
    
    let registerTableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
    }
    
    override func configureHierarchy() {
        [navigationBar, registerTableView].forEach { view.addSubview($0) }
    }
    
    override func configureConstraints() {
        navigationBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        registerTableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view)
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
    
    private func configureTableview() {
        let identifier = TitleTableViewCell.identifier
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(TitleTableViewCell.self, forCellReuseIdentifier: identifier)
    }
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = TitleTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TitleTableViewCell
        return cell
    }
    
    
}
