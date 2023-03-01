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
        WindowGroup<BulletinMainView> {
            let store = Store<
                BulletinMain.State,
                BulletinMain.Action
            >(
                initialState: BulletinMain.State(),
                reducer: BulletinMain(),
                prepareDependencies: { dependencies in
                    dependencies.worshipService = WorshipServiceKey.liveValue
                }
            )
            BulletinMainView(store: store)
        }
    }
}
