//
//  API.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Moya
import Foundation

protocol API: TargetType { }

extension API {
	var baseURL: URL { fatalError("BaseURL configured in Network core class") }
	
	var method: Moya.Method { .get }
}

