//
//  StatementService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Combine
import Moya

final class StatementService: StatementUseCase {
    
    private let provider: Provider<StatementAPI>
    
    init(context: Context) {
        self.provider = context.network.provider()
    }
    
    func fetchStatements(for account: Account, from: Date, to: Date) async -> Result<[Statement], MonobankError> {
        return .success([])
    }
    
}


