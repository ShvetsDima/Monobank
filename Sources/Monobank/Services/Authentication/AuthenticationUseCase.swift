//
//  AuthenticationUseCase.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

public protocol AuthenticationUseCase: AutoUseCaseProvider {
    var apiToken: String? { get }
    func authenticateWith(_ apiToken: String)
    func logout() throws
}
