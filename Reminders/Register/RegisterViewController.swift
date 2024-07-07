//
//  RegisterViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import PhotosUI
import RealmSwift
import SnapKit

protocol PassRegisterDetailDelegate {
    func passDueDateValue(_ date: Date)
    func passTag(_ tag: String)
    func passPriority(_ priority: Priority?)
}

class RegisterViewController: BaseViewController {
    var selectedDueDate: Date?
    var currentTag: String?
    var selectedPriority: Priority?
    var selectedImage: UIImage?
    
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
        guard let titleCell = registerTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TitleTableViewCell,
              let contentCell = registerTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? ContentTableViewCell
        else {
            print("failed toast message")
            return
        }
        
        let title = titleCell.titleTextView.text ?? ""
        let content = contentCell.contentTextView.text ?? ""
        let reminder = ReminderTable(reminderTitle: title, content: content, dueDate: selectedDueDate ?? Date(), tag: currentTag, priority: selectedPriority?.title)
        
        let repository = ReminderRepository()
        repository.createReminder(reminder)
        dismiss(animated: true)
    }
    
    private func configureTableview() {
        let titleIdentifier = TitleTableViewCell.identifier
        let contentIdenfier = ContentTableViewCell.identifier
        let componentIdentifier = ComponentTableViewCell.identifier
        let addImageIdentifier = AddImageTableViewCell.identifier
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(TitleTableViewCell.self, forCellReuseIdentifier: titleIdentifier)
        registerTableView.register(ContentTableViewCell.self, forCellReuseIdentifier: contentIdenfier)
        registerTableView.register(ComponentTableViewCell.self, forCellReuseIdentifier: componentIdentifier)
        registerTableView.register(AddImageTableViewCell.self, forCellReuseIdentifier: addImageIdentifier)
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
                dateFormatter.dateFormat = "yyyy.MM.dd (E)"
                dateFormatter.locale = Locale(identifier: "ko_KR")
                if let date = selectedDueDate {
                    cell.valueLabel.text = dateFormatter.string(from: date)
                } else {
                    cell.valueLabel.text = nil
                }
                return cell
            case .tag:
                let identifier = ComponentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ComponentTableViewCell
                cell.configureTitle(cellTitle: cellType)
                if let tag = currentTag {
                    cell.valueLabel.text = tag
                } else {
                    cell.valueLabel.text = nil
                }
                return cell
            case .priority:
                let identifier = ComponentTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ComponentTableViewCell
                cell.configureTitle(cellTitle: cellType)
                if let priority = selectedPriority {
                    cell.valueLabel.text = priority.title
                } else {
                    cell.valueLabel.text = nil
                }
                return cell
            case .addImage:
                let identifier = AddImageTableViewCell.identifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AddImageTableViewCell
                cell.configureTitle(cellTitle: cellType)
                if let image = selectedImage {
                    cell.userImageView.image = image
                }
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
            print("duedate delegate?????????????????")
            navigationController?.pushViewController(dueDateVC, animated: true)
        case .tag:
            let tagVC = TagViewController()
            tagVC.delegate = self
            print("tag delegate??????????")
            navigationController?.pushViewController(tagVC, animated: true)
        case .priority:
            let priorityVC = PriorityViewController()
            priorityVC.delegate = self
            navigationController?.pushViewController(priorityVC, animated: true)
        case .addImage:
            var configuration = PHPickerConfiguration()
            configuration.selectionLimit = 3
            configuration.filter = .any(of: [.screenshots, .images, .livePhotos])
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
            present(picker, animated: true)
        default:
            break
        }
    }
}

extension RegisterViewController: PassRegisterDetailDelegate {
    func passDueDateValue(_ date: Date) {
        print(#function, date)
        selectedDueDate = date
        registerTableView.reloadData()
    }
    
    func passTag(_ tag: String) {
        print(#function, tag)
        currentTag = tag
        registerTableView.reloadData()
    }
    
    func passPriority(_ priority: Priority?) {
        print(#function, priority ?? "no priority")
        selectedPriority = priority
        registerTableView.reloadData()
    }
}

extension RegisterViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        print(#function)
        picker.dismiss(animated: true)
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    self.selectedImage = image as? UIImage
                    self.registerTableView.reloadData()
                }
            }
        }
    }
}
