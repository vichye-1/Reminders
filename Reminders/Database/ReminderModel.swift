//
//  ReminderModel.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import Foundation
import RealmSwift

class ReminderTable: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted(indexed: true) var reminderTitle: String
    @Persisted var content: String?
    @Persisted var dueDate: Date
    @Persisted var tag: String?
    @Persisted var priority: String?
    
    convenience init(reminderTitle: String, content: String? = nil, dueDate: Date, tag: String? = nil, priority: String? = nil) {
        self.init()
        self.reminderTitle = reminderTitle
        self.content = content
        self.dueDate = dueDate
        self.tag = tag
        self.priority = priority
    }
}
