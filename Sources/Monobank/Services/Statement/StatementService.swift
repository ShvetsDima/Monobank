//
//  StatementService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class StatementService: StatementUseCase {
    
    private let provider: Provider<StatementAPI>
    private let cache: CacheProvider<String, [Statement]>
    
    init(context: Context) {
        self.provider = context.network.provider()
        self.cache = context.cache.authorizedProvider()
    }
    
    func statements(for account: Account, from: Date, to: Date) async throws -> [Statement] {
        if let cache = cache.value(for: Cache.Key.statement.rawValue) { return cache }

        let params = StatementParams(account: account.id, from: from, to: to)
        
        let statements = try await provider
            .request(target: .statement(params))
            .map([Statement].self)
        
        cache.set(value: statements, for: Cache.Key.statement.rawValue)

        return statements
    }
}


