//
//  LogPlugin.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

final class LogPlugin: PluginType {
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            print("Response: ")
            if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                print(json)
            } else {
                let response = String(data: body.data, encoding: .utf8)
				print(response as Any)
            }
        case .failure( _):
            break
        }
        #endif
    }
}
