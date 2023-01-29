//
//  OhjooyeoApp.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import SwiftUI
import ComposableArchitecture

@main
struct OhjooyeoApp: App {
    var body: some Scene {
        WindowGroup {
            let store = Store<
                BulletinMainReducer.State,
                BulletinMainReducer.Action
            >(
                initialState: BulletinMainReducer.State(items: BulletinItem.makeDummy()),
                reducer: BulletinMainReducer()
            )
            BulletinMainView(store: store)
        }
    }
}
