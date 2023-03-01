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
    func fetchWorshipIDs(date: String?) async throws -> WorshipsResponse
    func fetchBulleinInfo(worshipID: Int) async throws -> BulletinResponse
}

enum WorshipServiceKey: DependencyKey {
    typealias Value = WorshipService
    
    static var liveValue: Value = WorshipServiceImpl(provider: NetworkManager.shared)
    static var testValue: Value = WorshipServiceMock()
    static var previewValue: Value = WorshipServiceMock()
}

extension DependencyValues {
    var worshipService: WorshipService {
        get { self[WorshipServiceKey.self] }
        set { self[WorshipServiceKey.self] = newValue }
    }
}
