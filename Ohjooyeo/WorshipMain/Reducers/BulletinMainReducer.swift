//
//  BulletinMainReducer.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import ComposableArchitecture

struct BulletinMainReducer: ReducerProtocol {
    
    @Dependency(\.worshipService) var worshipService

    enum Action: Equatable {
        case didLoad
        case setupBulletin(TaskResult<[BulletinItem]>)
    }
    
    struct State: Equatable {
        var items = [BulletinItem]()
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didLoad:
            return .task {
                return await .setupBulletin(
                    TaskResult {
                        let bulletinOrders = try await worshipService
                            .fetchBulleinInfo(worshipID: 1)
                            .bulletinOrders
                        return bulletinOrders.map { $0.toBulletinItem }
                    }
                )
            }
        case let .setupBulletin(items):
            do {
                state.items = try items.value
                
                print("### \(state.items)")
            } catch {
                print("### [ERROR] \(error)")
            }
        }
        return .none
    }
}
