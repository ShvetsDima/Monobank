//
//  ClientInfoService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Combine
import Moya

final class ClientInfoService: ClientInfoUseCase {

    private let provider: Provider<ClientInfoAPI>
    
    init(context: Context) {
        self.provider = context.network.provider()
    }
    
//    func fetchClientInfo() async -> Result<ClientInfo, MonobankError> {
// 
//    }
    
}
