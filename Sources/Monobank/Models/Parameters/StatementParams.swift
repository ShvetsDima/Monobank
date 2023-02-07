//
//  StatementParams.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public struct StatementParams: Codable {
    let account: Account.ID
    let from: Date
    let to: Date
}


