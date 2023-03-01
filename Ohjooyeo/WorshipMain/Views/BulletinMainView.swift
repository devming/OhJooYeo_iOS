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
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    List {
                        Section {
                            ForEach(viewStore.state.items) { item in
                                BulletinCell(item: item)
                                    .listRowSeparator(.hidden)
                            }
                        } header: {
                            Text("1부 예배")
                                .font(.title3)
                                .bold()
                                .fontWidth(.expanded)
                                .foregroundColor(.black)
                        }
                    }
                    .onAppear {
                        viewStore.send(.didLoad)
                    }
                    .listStyle(.plain)
                    .background(.clear)
                    .alert(
                        LocalizedStringKey(viewStore.errorMessage ?? "Errr"),
                        isPresented: viewStore.binding(
                            get: { $0.errorMessage != nil },
                            send: .alertDismissed
                        ),
                        presenting: Void()) { _ in }
                }
                .navigationTitle("예배 순서")
                .onTapGesture {
                    viewStore.send(.didLoad)
                }
            }
        }
    }
}

struct BulletinMainView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store<
            BulletinMainReducer.State,
            BulletinMainReducer.Action
        >(
            initialState: BulletinMainReducer.State(items: BulletinItem.makeDummy()),
            reducer: BulletinMainReducer()
        )
        return BulletinMainView(store: store)
    }
}

struct MainAlert: Identifiable {
    var message: String
    var id: String { self.message }
}
