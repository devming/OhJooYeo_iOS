//
//  BulletinMainTests.swift
//  OhjooyeoTests
//
//  Created by devming on 2023/01/29.
//

import XCTest
import ComposableArchitecture
@testable import Ohjooyeo

final class BulletinMainTests: BaseTests {

    private var bulletinItems: [BulletinItem]!
    
    override func setUp() {
        super.setUp()
        
        bulletinItems = BulletinResponse.successResponseData
            .bulletinOrders.map { $0.toBulletinItem }
    }
    
    override func tearDown() {
        super.tearDown()
        
        bulletinItems = nil
    }
    
    @MainActor
    func test_WorshipMain화면진입시_주보API호출() async {
        let store = TestStore(
            initialState: BulletinMain.State(items: bulletinItems),
            reducer: BulletinMain(),
            observe: { $0.items },
            prepareDependencies: { $0.worshipService = WorshipServiceKey.testValue }
        )
        
        await store.send(.didLoad)
        let result: TaskResult<[BulletinItem]> = .success(bulletinItems)
        await store.receive(.setupBulletin(result))
        
        XCTAssertEqual(
            store.state.items.map { $0.id },
            [0, 1, 2, 3, 4]
        )
    }
}
