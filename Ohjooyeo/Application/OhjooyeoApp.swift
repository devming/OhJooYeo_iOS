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
        // TODO: 여기서 liveValue를 주입하니까 test코드에 영향을 준다. 고민중..
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
