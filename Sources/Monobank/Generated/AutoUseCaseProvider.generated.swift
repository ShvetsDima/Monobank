// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public protocol HasAuthenticationUseCase {
    var authentication: AuthenticationUseCase { get }
}
public protocol HasClientInfoUseCase {
    var clientInfo: ClientInfoUseCase { get }
}
public protocol HasCurrencyUseCase {
    var currency: CurrencyUseCase { get }
}
public protocol HasStatementUseCase {
    var statement: StatementUseCase { get }
}

public typealias UseCases =
    HasAuthenticationUseCase &
    HasClientInfoUseCase &
    HasCurrencyUseCase &
    HasStatementUseCase

public protocol UseCasesProvider: UseCases {}
