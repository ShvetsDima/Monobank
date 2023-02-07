//
//  MonobankError+Network.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

extension MonobankError {
    init(_ moyaError: MoyaError) {
        self = .network(moyaError)
    }
}
