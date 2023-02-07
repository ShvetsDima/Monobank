//
//  ClientInfo.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public struct ClientInfo: Codable, Identifiable {
    public let id: String
    let name: String
    let webHookUrl: String
    var accounts: [Account]
}
