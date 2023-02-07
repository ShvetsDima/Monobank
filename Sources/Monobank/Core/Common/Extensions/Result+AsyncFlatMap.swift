//
//  Result+AsyncFlatMap.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

extension Result {
    func asyncFlatMap<T>(_ transform:(Success) async -> T) async -> Result<T, MonobankError> {
        switch self {
        case let .success(success):
            return await .success(transform(success))
        case let .failure(error):
            if let monobankError = error as? MonobankError {
                return .failure(monobankError)
            } else {
                return .failure(MonobankError.uknown(error))
            }
        }
    }
}

