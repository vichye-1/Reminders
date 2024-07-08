//
//  ReminderRepository.swift
//  Reminders
//
//  Created by 양승혜 on 7/8/24.
//

import UIKit
import RealmSwift

final class ReminderRepository {
    private let realm = try! Realm()
    
    func createReminder(_ reminder: ReminderTable) {
        do {
            try realm.write {
                realm.add(reminder)
                print("Realm create Succeed")
            }
        } catch {
            print("Realm create fail")
        }
    }
    
    func detectRealmURL() {
        print(realm.configuration.fileURL ?? "")
    }
    
    func fetchAll() -> Results<ReminderTable> {
        return realm.objects(ReminderTable.self).sorted(byKeyPath: "dueDate", ascending: true)
    }
    
    func toggleReminder(_ reminder: ReminderTable) {
        do {
            try realm.write {
                reminder.isCompleted.toggle()
                print("Realm toggle succeed")
            }
        } catch {
            print("Fail toggle")
        }
    }
}
