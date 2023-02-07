//
//  Statement.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public struct Statement: Codable, Identifiable {
    public let id: String
    let time: Int
    let description: String
    let mcc: Int
    let hold: Bool
    let amount: Int
    let operationAmount: Int
    let currencyCode: Int
    let commissionRate: Int
    let cashbackAmount: Int
    let balance: Int
    let comment: String
    let receiptId: String
    let counterEdrpou: String
    let counterIban: String
}


