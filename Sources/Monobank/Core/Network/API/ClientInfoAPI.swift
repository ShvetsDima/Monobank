//
//  ClientInfoAPI.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

enum ClientInfoAPI: API {
    
    case personalInfo
    
    var path: String { "/personal/client-info" }
    
    var sampleData: Data { path.data(using: .utf8) ?? Data() }
    
    var task: Task { .requestPlain }
    
    var headers: [String : String]? { nil }
    
    var needAuth: Bool { true }
}

