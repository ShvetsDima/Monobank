//
//  AuthPlugin.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

final class AuthPlugin: PluginType {
	
	private static let authHeader = "X-Token"
	
    private let keychain: KeychainStorage
        
    init(_ keychain: KeychainStorage) {
        self.keychain = keychain
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard target.needAuth else { return request }
        var updatedRequest = request
		let token = keychain.value(for: KeychainService.Key.token.rawValue)
		updatedRequest.setValue(token, forHTTPHeaderField: AuthPlugin.authHeader)
        return updatedRequest
    }
}
