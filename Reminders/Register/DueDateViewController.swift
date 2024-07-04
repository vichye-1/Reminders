//
//  DueDateViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class DueDateViewController: BaseViewController {
    
    var delegate: PassDueDateDelegate?
    
    var datePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.passDueDateValue(datePicker.date)
    }
    
    override func configureHierarchy() {
        view.addSubview(datePicker)
    }
    override func configureConstraints() {
        datePicker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func configureUI() {
        navigationItem.title = "마감일"
    }
    
    func configureDatePicker() {
        
    }
}
