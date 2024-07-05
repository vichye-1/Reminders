//
//  PriorityViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

class PriorityViewController: BaseViewController {
    
    let prioritySegment = {
       let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "높음", at: 0, animated: true)
        segment.insertSegment(withTitle: "보통", at: 1, animated: true)
        segment.insertSegment(withTitle: "낮음", at: 2, animated: true)
        segment.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHierarchy() {
        view.addSubview(prioritySegment)
    }
    
    override func configureConstraints() {
        prioritySegment.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    override func configureUI() {
        navigationItem.title = "우선 순위"
    }
}
