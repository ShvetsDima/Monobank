//
//  CurrencyRate.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public struct CurrencyRate: Codable {
    let currencyCodeA: Int
    let currencyCodeB: Int
    let date: Date
    let rateBuy: Float
    let rateCross: Float
    let rateSell: Float
}
