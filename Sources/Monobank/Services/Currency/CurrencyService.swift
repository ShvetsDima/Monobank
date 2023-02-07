//
//  CurrencyService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class CurrencyService: CurrencyUseCase {
    
    private let provider: Provider<CurrencyRateAPI>
    private let cache: CacheProvider<String, [CurrencyRate]>
    
    init(context: Context) {
        self.provider = context.network.provider()
        self.cache = context.cache.unAuthorizedProvider()
    }
    
    var сurrencyRates: [CurrencyRate] {
        get async throws {
            if let cache = cache.value(for: Cache.Key.currency.rawValue) { return cache }

            let rates = try await provider
                .request(target: .currencies)
                .map([CurrencyRate].self)
            
            cache.set(value: rates, for: Cache.Key.currency.rawValue)
            
            return rates
        }
    }
}
