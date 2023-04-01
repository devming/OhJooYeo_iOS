//
//  BaseTests.swift
//  OhjooyeoTests
//
//  Created by devming on 2023/04/01.
//

import XCTest

class BaseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        print("")
        print("🩻 [Test Started] \(String(describing: Self.description())) 🩻")
    }
    
    override func tearDown() {
        super.tearDown()
        
        print("🩻 [Test Finished] \(String(describing: Self.description())) 🩻")
        print("")
    }
}
