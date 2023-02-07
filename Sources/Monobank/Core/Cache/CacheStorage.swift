//
//  Cache.swift
//  Monobank
//
//  Created by Dima Shvets on 31.01.2023.
//

import Foundation
import Cache

protocol CacheStorage {
	associatedtype T: Codable
	func value(for key: AnyHashable) throws -> T?
	func set(value: T, for key: AnyHashable) throws
	func clear() throws
}

final class CacheService<T: Codable>: CacheStorage {
	
	private let storage: Storage<AnyHashable, T>
	
	init(name: String, expiry: TimeInterval) throws {
		let expiryDate = Expiry.date(Date().addingTimeInterval(expiry))
		let diskConfig = DiskConfig(name: name, expiry: expiryDate)
		let memoryConfig = MemoryConfig(expiry: expiryDate)
		self.storage = try Storage(diskConfig: diskConfig,
								   memoryConfig: memoryConfig,
								   transformer: TransformerFactory.forCodable(ofType: T.self))
	}
	
	func value(for key: AnyHashable) throws -> T? {
		if try storage.existsObject(forKey: key) {
			if try storage.isExpiredObject(forKey: key) {
				try storage.removeExpiredObjects()
				return nil
			} else {
				return try storage.object(forKey: key)
			}
		} else {
			return nil
		}
	}
	
	func set(value: T, for key: AnyHashable) throws {
		
		try storage.setObject(value, forKey: key)
	}
	
	func clear() throws {
		try storage.removeAll()
	}
	
}
