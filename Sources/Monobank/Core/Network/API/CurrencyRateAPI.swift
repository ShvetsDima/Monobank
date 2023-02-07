//
//  CurrencyRateAPI.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

enum CurrencyRateAPI: API {
    
    case currencies
    
    var path: String { "/bank/currency" }
    
    var sampleData: Data { path.data(using: .utf8) ?? Data() }
    
    var task: Task { .requestPlain }
    
    var headers: [String : String]? { nil }
}


