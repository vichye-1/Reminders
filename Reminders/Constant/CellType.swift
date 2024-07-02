//
//  CellType.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import Foundation

enum CellType: Int, CaseIterable {
    case title
    case memo
    case duedate
    case tag
    case priority
    case addImage
    
    var title: String {
        switch self {
        case .title:
            return "제목"
        case .memo:
            return "메모"
        case .duedate:
            return "마감일"
        case .tag:
            return "태그"
        case .priority:
            return "우선 순위"
        case .addImage:
            return "이미지 추가"
        }
    }
}
