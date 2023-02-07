//
//  Storage.swift
//
//
//  Created by Dima Shvets on 07.11.2023.
//

import Foundation

protocol Storage {
    associatedtype Key: Hashable
    associatedtype Value: Codable
    func value(for key: Key) -> Value?
    func set(value: Value, for key: Key)
    func removeValue(for key: Key)
    func clear()
}
