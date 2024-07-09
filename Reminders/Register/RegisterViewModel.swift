//
//  DueDateViewModel.swift
//  Reminders
//
//  Created by 양승혜 on 7/9/24.
//

import Foundation

class RegisterViewModel {
    
    let selectedDueDate: Observable<Date?> = Observable(nil)
    let dueDateString: Observable<String> = Observable("")
    
    
    init() {
        selectedDueDate.bind { date in
            self.updateFormattedDate(date ?? Date())
        }
    }
    
    private func updateFormattedDate(_ date: Date?) {
        guard let date = date else {
            dueDateString.value = ""
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd (E)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dueDateString.value = dateFormatter.string(from: date)
    }
}
