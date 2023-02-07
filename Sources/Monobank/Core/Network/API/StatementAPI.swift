//
//  StatementAPI.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

enum StatementAPI: API {
    
    case statement(StatementParams)
    
    var path: String {
        switch self {
        case .statement(let params):
            return "/personal/statement/\(params.account)/\(params.from)/\(params.to)"
        }
    }
    
    var sampleData: Data { path.data(using: .utf8) ?? Data() }
    
    var task: Task { .requestPlain }
    
    var headers: [String : String]? { nil }
    
    var needAuth: Bool { true }
}


