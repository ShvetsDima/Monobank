//
//  StatementUseCase.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public protocol StatementUseCase {
    func statements(for account: Account, from: Date, to: Date) async throws -> [Statement]
}
