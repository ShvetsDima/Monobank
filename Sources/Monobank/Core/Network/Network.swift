//
//  Network.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import Moya

final class Network {
	
	private let environment: Environment
	private let plugins: [PluginType]
	
	init(environment: Environment, keychain: KeychainStorage) {
		self.environment = environment
		self.plugins = [AuthPlugin(keychain), LogPlugin()]
	}
	
	func provider<Target: TargetType>() -> Provider<Target> {
		Provider(baseURL: environment.baseURL, plugins: plugins)
	}
	
}

final class Provider<Target: TargetType>: MoyaProvider<Target> {
	
	fileprivate init(baseURL: URL, plugins: [PluginType]) {
		super.init(endpointClosure: Provider.enpointClosure(baseURL), plugins: plugins)
	}
	
	func request(target: Target) async throws -> Response {
		try await withCheckedThrowingContinuation({ continuation in
			super.request(target) { result in
				switch result {
				case .success(let response):
					continuation.resume(returning: response)
				case .failure(let error):
					continuation.resume(throwing: error)
				}
			}
		})
	}
	
	static func enpointClosure(_ baseURL: URL) -> (TargetType) -> Endpoint {
		{ target in
			Endpoint(
				url: baseURL.appendingPathComponent(target.path).absoluteString,
				sampleResponseClosure: { .networkResponse(200, target.sampleData) },
				method: target.method,
				task: target.task,
				httpHeaderFields: target.headers
			)
		}
	}
}

