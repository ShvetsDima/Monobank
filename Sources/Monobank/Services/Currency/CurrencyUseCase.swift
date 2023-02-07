//
//  CurrencyUseCase.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public protocol CurrencyUseCase: AutoUseCaseProvider {
	func getCurrencyRates() async throws -> [CurrencyRate]
}

