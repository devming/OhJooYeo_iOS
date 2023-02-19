//
//  WorshipService.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/18.
//

import Foundation
import Combine
import ComposableArchitecture

protocol WorshipService {
    var provider: NetworkProtocol { get set }
    
    func fetchWorshipIDs(date: String?) async throws -> WorshipsResponse
    func fetchBulleinInfo(worshipID: Int) async throws -> BulletinResponse
}

private enum WorshipServiceKey: DependencyKey {
    static let liveValue = WorshipServiceImpl(provider: NetworkManager.shared)
}

extension DependencyValues {
    var worshipService: WorshipServiceImpl {
        get { self[WorshipServiceKey.self] }
        set { self[WorshipServiceKey.self] = newValue }
    }
}
