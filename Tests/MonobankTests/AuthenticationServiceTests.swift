//
//  AuthenticationServiceTests.swift
//
//
//  Created by Dima Shvets on 16.01.2024.
//

import XCTest
@testable import Monobank

final class AuthenticationServiceTests: XCTestCase {
    
    var monobank: Monobank?
    
    override func setUp() {
        super.setUp()
        monobank = Monobank()
    }
    
    override func tearDown() {
        super.tearDown()
        monobank = nil
    }
    
}
