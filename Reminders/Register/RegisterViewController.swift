//
//  RegisterViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import RealmSwift
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
        let leftButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(CancelButtonClicked))
        let rightButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonClicked))
        navItem.rightBarButtonItem = rightButton
        navItem.leftBarButtonItem = leftButton
        navigationBar.setItems([navItem], animated: true)
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    @objc
    private func CancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc
    private func addButtonClicked() {
        print(#function)
        let realm = try! Realm()
        guard let titleCell = registerTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TitleTableViewCell else {
            print("toast message")
            return
        }
        let title = titleCell.titleTextView.text ?? ""
        
        let reminder = ReminderTable(reminderTitle: title, dueDate: Date())
        reminder.reminderTitle = title
        
        try! realm.write {
            realm.add(reminder)
            print("reminder saved successfully")
        }
        dismiss(animated: true)
    }
    
    private func configureTableview() {
        let titleIdentifier = TitleTableViewCell.identifier
        let contentIdenfier = ContentTableViewCell.identifier
        let componentIdentifier = ComponentTableViewCell.identifier
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(TitleTableViewCell.self, forCellReuseIdentifier: titleIdentifier)
        registerTableView.register(ContentTableViewCell.self, forCellReuseIdentifier: contentIdenfier)
        registerTableView.register(ComponentTableViewCell.self, forCellReuseIdentifier: componentIdentifier)
    }
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellType.allCases.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let identifier = TitleTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TitleTableViewCell
                return cell
            } else if indexPath.row == 1 {
                let identifier = ContentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ContentTableViewCell
                return cell
            }
            
        default:
            let identifier = ComponentTableViewCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ComponentTableViewCell
            let cellType = CellType.allCases[indexPath.section + 1]
            cell.configureTitle(cellTitle: cellType)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 || indexPath.row == 1 {
                return UITableView.automaticDimension
            } else {
                return 44
            }
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = CellType.allCases[indexPath.section + 1]
        switch cellType {
        case .duedate:
            let dueDateVC = DueDateViewController()
            let nextVC = UINavigationController(rootViewController: dueDateVC)
            present(nextVC, animated: true)
        default:
            break
        }
    }
}
