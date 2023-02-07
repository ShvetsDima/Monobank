//
//  ClientInfoService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class ClientInfoService: ClientInfoUseCase {
    
    private let provider: Provider<ClientInfoAPI>
    private let cache: CacheProvider<String, ClientInfo>
    
    init(context: Context) {
        self.provider = context.network.provider()
        self.cache = context.cache.authorizedProvider()
    }
    
    var clientInfo: ClientInfo {
        get async throws {
            if let cache = cache.value(for: Cache.Key.clientInfo.rawValue) { return cache }
            
            let clientInfo = try await provider
                .request(target: .personalInfo)
                .map(ClientInfo.self)
            
            cache.set(value: clientInfo, for: Cache.Key.clientInfo.rawValue)

            return clientInfo
        }
    }
}
