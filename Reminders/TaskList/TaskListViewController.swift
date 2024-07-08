//
//  TaskListViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/8/24.
//

import UIKit
import SnapKit

class TaskListViewController: BaseViewController {
    
    let identifier = TaskListTableViewCell.identifier
    
    private let taskListTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .customBackGround
        return tableView
    }()
    
    override func configureHierarchy() {
        view.addSubview(taskListTableView)
    }
    
    override func configureConstraints() {
        taskListTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureTableView() {
        taskListTableView.delegate = self
        taskListTableView.dataSource = self
        taskListTableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: identifier)
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
