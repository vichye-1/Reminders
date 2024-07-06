//
//  ViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/2/24.
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController {
    
    private let identifier = HomeCollectionViewCell.identifier
    
    private let homeCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private let newReminderButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "새로운 할 일"
        configuration.image = UIImage(systemName: "plus.circle.fill")
        configuration.imagePadding = 4
        configuration.baseForegroundColor = .systemBlue
        button.contentHorizontalAlignment = .leading
        button.configuration = configuration
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newReminderButton.addTarget(self, action: #selector(newReminderButtonClicked), for: .touchUpInside)
    }
    
    @objc
    private func newReminderButtonClicked() {
        let nextVC = RegisterViewController()
        let navController = UINavigationController(rootViewController: nextVC)
        present(navController, animated: true)
    }
    
    override func configureHierarchy() {
        [homeCollectionView, newReminderButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        homeCollectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(newReminderButton.snp.top)
        }
        
        newReminderButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
            make.width.equalTo(view.snp.width).multipliedBy(0.45)
        }
    }
    
    override func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HomeCollectionViewCell
        return cell
    }
}
