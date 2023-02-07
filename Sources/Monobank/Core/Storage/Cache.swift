//
//  Cache.swift
//  
//
//  Created by Dima Shvets on 07.11.2023.
//

import Foundation
import Cache
import OSLog

final class Cache {

    private let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func authorizedProvider<Key: Hashable, Value: Codable>() -> CacheProvider<Key, Value> {
        CacheProvider(expiry: environment.authorizedCacheExpiry)
    }
    
    func unAuthorizedProvider<Key: Hashable, Value: Codable>() -> CacheProvider<Key, Value> {
        CacheProvider(expiry: environment.unauthorizedCacheExpiry)
    }
    
}

final class CacheProvider<Key: Hashable, Value: Codable>: Storage {

    private let storage: MemoryStorage<Key, Value>
    
    fileprivate init(expiry: TimeInterval) {
        let memoryConfig = MemoryConfig(expiry: .seconds(expiry))
        self.storage = MemoryStorage<Key, Value>(config: memoryConfig)
    }
    
    func value(for key: Key) -> Value? {
        do {
            let expired = try storage.isExpiredObject(forKey: key)
            let exists = try storage.existsObject(forKey: key)
            
            if expired {
                removeValue(for: key)
                return nil
            } else {
                return exists ? try storage.entry(forKey: key).object : nil
            }
        } catch let error {
            os_log("Cache Error: ", error.localizedDescription)
            return nil
        }
    }
    
    func set(value: Value, for key: Key) {
        storage.setObject(value, forKey: key)
    }
    
    func removeValue(for key: Key) {
        storage.removeObject(forKey: key)
    }
    
    func clear() {
        storage.removeAll()
    }
}

extension Cache {
    enum Key: String {
        case currency
        case statement
        case clientInfo
    }
}
