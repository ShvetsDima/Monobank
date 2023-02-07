//
//  Result+TryMap.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

extension Result {
    func tryMap<T>(_ transform:(Success) throws -> T) -> Result<T, MonobankError> {
        switch self {
        case let .success(success):
            do {
                return .success(try transform(success))
            } catch {
                return .failure(MonobankError.mapping(error))
            }
        case let .failure(error):
            if let monobankError = error as? MonobankError {
                return .failure(monobankError)
            } else {
                return .failure(MonobankError.uknown(error))
            }
        }
    }
}
