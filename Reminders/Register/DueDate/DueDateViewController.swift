//
//  DueDateViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

final class DueDateViewController: BaseViewController {
    
    var delegate: PassRegisterDetailDelegate?
    
    lazy var datePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.passDueDateValue(datePicker.date)
        print(#function, datePicker.date)
    }
    
    // MARK: - configure Methods
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
}
