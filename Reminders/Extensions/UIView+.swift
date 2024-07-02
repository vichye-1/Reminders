//
//  UIView+.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import UIKit

extension UIView: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
