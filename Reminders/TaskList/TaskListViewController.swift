//
//  TaskListViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/8/24.
//

import UIKit
import RealmSwift
import SnapKit

class TaskListViewController: BaseViewController {
    
    private let identifier = TaskListTableViewCell.identifier
    
    private let repository = ReminderRepository()
    private var reminders: Results<ReminderTable>?
    
    private let taskListTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .customBackGround
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackGround
        taskListTableView.backgroundColor = .customBackGround
        fetchReminders()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchReminders()
        taskListTableView.reloadData()
    }
    
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
    
    private func fetchReminders() {
        reminders = repository.fetchAll()
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TaskListTableViewCell
        cell.backgroundColor = .customBackGround
        if let reminder = reminders?[indexPath.row] {
            cell.configureTable(reminder: reminder)
            
            cell.checkButtonHandler = { _ in
                self.repository.toggleReminder(reminder)
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
