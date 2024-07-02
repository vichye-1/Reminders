//
//  ListViewController.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit
import RealmSwift

class ListViewController: BaseViewController {
    
    var reminderList: Results<ReminderTable>!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        reminderList = realm.objects(ReminderTable.self)
        if let fileUrl = realm.configuration.fileURL {
            print(fileUrl)
        } else {
            print("fail")
        }
        
        
    }
    
    
    
}
