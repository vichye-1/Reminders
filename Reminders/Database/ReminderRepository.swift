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
    
    func fetchAll() -> Results<ReminderTable> {
        return realm.objects(ReminderTable.self).sorted(byKeyPath: "dueDate", ascending: true)
    }
    
    func deleteReminder(_ reminder: ReminderTable) {
        do {
            try realm.write {
                realm.delete(reminder)
                print("Realm delete succeed")
            }
        } catch {
            print("Fail delete")
        }
    }
}
