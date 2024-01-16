//
//  ClientInfoUseCase.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public protocol ClientInfoUseCase {
    var clientInfo: ClientInfo { get async throws }
}
