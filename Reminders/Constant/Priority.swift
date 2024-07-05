//
//  Priority.swift
//  Reminders
//
//  Created by 양승혜 on 7/5/24.
//

import Foundation

enum Priority: Int {
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
