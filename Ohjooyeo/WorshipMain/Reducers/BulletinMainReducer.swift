//
//  BulletinMainReducer.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import Foundation
import ComposableArchitecture

struct BulletinMainReducer: ReducerProtocol {
    
    @Dependency(\.worshipService) var worshipService

    enum Action: Equatable {
        case didLoad
        case setupBulletin(TaskResult<[BulletinItem]>)
        case alertDismissed
    }
    
    struct State: Equatable {
        var emcee = ""
        var items = [BulletinItem]()
        var errorMessage: String?
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
        case let .setupBulletin(.success(items)):
            state.items = items
            return .none
        case let .setupBulletin(.failure(error)):
            state.errorMessage = error.localizedDescription
            return .none
        case .alertDismissed:
            state.errorMessage = nil
            return .none
        }
    }
}
