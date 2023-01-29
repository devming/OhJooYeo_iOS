//
//  BulletinMainView.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import SwiftUI
import ComposableArchitecture

struct BulletinMainView: View {
    let store: Store<
        BulletinMainReducer.State,
        BulletinMainReducer.Action
    >
    var body: some View {
        WithViewStore(store) { viewStore in
            List(viewStore.items) {
                BulletinCell(item: $0)
            }
            .onAppear {
                viewStore.send(.didLoad)
            }
            .padding()
        }
    }
}

struct BulletinMainView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store<
            BulletinMainReducer.State,
            BulletinMainReducer.Action
        >(
            initialState: BulletinMainReducer.State(),
            reducer: BulletinMainReducer()
        )
        return BulletinMainView(store: store)
    }
}
