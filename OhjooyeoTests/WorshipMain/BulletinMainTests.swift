//
//  BulletinMainTests.swift
//  OhjooyeoTests
//
//  Created by devming on 2023/01/29.
//

import XCTest
import ComposableArchitecture
@testable import Ohjooyeo

final class BulletinMainTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor
    func test_WorshipMain화면진입시_주보API호출() async {
        let value = BulletinResponse.successResponseData
            .bulletinOrders.map { $0.toBulletinItem }
        
        let store = TestStore(
            initialState: BulletinMain.State(items: value),
            reducer: BulletinMain(),
            observe: { state in
                return state.items
            },
            prepareDependencies: { dependencyValues in
                dependencyValues.worshipService = WorshipServiceKey.testValue
            }
        )
        
        await store.send(.didLoad)
        let result: TaskResult<[BulletinItem]> = .success(value)
        await store.receive(.setupBulletin(result))
    }
}
