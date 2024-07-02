//
//  ReuseIdentifierProtocol.swift
//  Reminders
//
//  Created by 양승혜 on 7/3/24.
//

import Foundation

protocol ReuseIdentifierProtocol: AnyObject {
    static var identifier: String { get }
}
