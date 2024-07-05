//
//  TagViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import SnapKit

final class TagViewController: BaseViewController {
    
    var delegate: PassRegisterDetailDelegate?
    
    let tagTextField = {
        let view = UITextField()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.placeholder = "태그를 입력해주세요"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        var tagText = tagTextField.text ?? ""
        if !tagText.isEmpty && !tagText.hasPrefix("#") {
            tagText = "#" + tagText
        }
        delegate?.passTag(tagText)
        print(#function, tagText)
    }
    
    override func configureHierarchy() {
        view.addSubview(tagTextField)
    }
    
    override func configureConstraints() {
        tagTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    override func configureUI() {
        navigationItem.title = "태그"
    }
    
    
}
