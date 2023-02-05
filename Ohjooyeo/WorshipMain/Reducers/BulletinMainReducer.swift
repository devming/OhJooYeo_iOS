//
//  BulletinMainReducer.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import ComposableArchitecture

struct BulletinMainReducer: ReducerProtocol {

    enum Action: Equatable {
        case didLoad
    }
    
    struct State: Equatable {
        var items = [BulletinItem]()
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didLoad:
            state.items = BulletinItem.makeDummy()
        }
        return .none
    }
}
