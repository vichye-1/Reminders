//
//  RegisterViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import RealmSwift
import SnapKit

protocol PassDueDateDelegate {
    func passDueDateValue(_ date: Date)
}

class RegisterViewController: BaseViewController {
    
    var selectedDueDate: Date?
    
    let registerTableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
    }
    
    override func configureHierarchy() {
        [registerTableView].forEach { view.addSubview($0) }
    }
    
    override func configureConstraints() {
        registerTableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    override func configureUI() {
        title = "새로운 할 일"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonClicked))
    }
    
    @objc
    private func cancelButtonClicked() {
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
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let identifier = TitleTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TitleTableViewCell
                return cell
            case 1:
                let identifier = ContentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ContentTableViewCell
                return cell
            default:
                break
            }
        } else {
            let cellType = CellType.allCases[indexPath.section + 1]
            
            switch cellType {
            case .duedate:
                let identifier = ComponentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ComponentTableViewCell
                cell.configureTitle(cellTitle: cellType)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy.MM.dd"
                if let date = selectedDueDate {
                    cell.componentLabel.text = dateFormatter.string(from: date)
                } else {
                    cell.componentLabel.text = cellType.title
                }
                return cell
            case .tag, .priority, .addImage:
                let identifier = ComponentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ComponentTableViewCell
                cell.configureTitle(cellTitle: cellType)
                return cell
            default:
                return UITableViewCell()
            }
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
            dueDateVC.delegate = self
            print("delegate?????????????????")
            navigationController?.pushViewController(dueDateVC, animated: true)
        case .tag:
            let tagVC = TagViewController()
            navigationController?.pushViewController(tagVC, animated: true)
        case .priority:
            let priorityVC = PriorityViewController()
            navigationController?.pushViewController(priorityVC, animated: true)
        default:
            break
        }
    }
}

extension RegisterViewController: PassDueDateDelegate {
    func passDueDateValue(_ date: Date) {
        print(#function, date)
        selectedDueDate = date
        registerTableView.reloadData()
    }
}
