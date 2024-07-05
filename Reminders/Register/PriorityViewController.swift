//
//  PriorityViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

final class PriorityViewController: BaseViewController {
    
    private enum Priority: Int {
        case high = 0
        case medium = 1
        case low = 2
        
        var title: String {
            switch self {
            case .high:
                return "높음"
            case .medium:
                return "보통"
            case .low:
                return "낮음"
            }
        }
    }
    
    private let prioritySegment = {
       let segment = UISegmentedControl()
        segment.insertSegment(withTitle: Priority.high.title, at: Priority.high.rawValue, animated: true)
        segment.insertSegment(withTitle: Priority.medium.title, at: Priority.medium.rawValue, animated: true)
        segment.insertSegment(withTitle: Priority.low.title, at: Priority.low.rawValue, animated: true)
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
