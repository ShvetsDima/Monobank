//
//  CurrencyService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

final class CurrencyService: CurrencyUseCase {
	
	private let provider: Provider<CurrencyRateAPI>
	private let cache: Cache
	
	init(context: Context) {
		self.provider = context.network.provider()
		self.cache = context.cache
	}
	
	func getCurrencyRates() async throws -> [CurrencyRate] {
		let cache = try cache.unauthorized() as CacheService<[CurrencyRate]>
		
		if let cachedCurrencyRates = try cache.value(for: Cache.Key.currency.rawValue) {
			return cachedCurrencyRates
		}
		
		let currencyRates = try await provider
			.request(target: .currencies)
			.map([CurrencyRate].self)
		
		try cache.set(value: currencyRates, for: Cache.Key.currency.rawValue)
		
		return currencyRates.sorted(by: compare(_:_:))
	}
	
	private func compare(_ lhs: CurrencyRate, _ rhs: CurrencyRate) -> Bool {
		lhs.rateBuy != nil && lhs.rateSell != nil || rhs.rateBuy != nil && rhs.rateSell != nil
	}
}
