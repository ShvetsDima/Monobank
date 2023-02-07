//
//  Monobank.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final public class Monobank: UseCasesProvider {
	
	private let context: Context
	
	private lazy var authenticationService = AuthenticationService(context: context)
	private lazy var currencyService = CurrencyService(context: context)
	private lazy var clientInfoService = ClientInfoService(context: context)
	private lazy var statementService = StatementService(context: context)
	
	public var authentication: AuthenticationUseCase { authenticationService }
	public var currency: CurrencyUseCase { currencyService }
	public var clientInfo: ClientInfoUseCase { clientInfoService }
	public var statement: StatementUseCase { statementService }
	
	public init() {
		let environment = Environment()
		self.context = Context(environment: environment)
	}
	
}

