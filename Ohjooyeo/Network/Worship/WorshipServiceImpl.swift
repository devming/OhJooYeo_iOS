//
//  WorshipServiceImpl.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/05.
//

import Foundation

struct WorshipServiceImpl: WorshipService {
    var provider: NetworkProtocol
    
    init(provider: NetworkProtocol) {
        self.provider = provider
    }
    
    func fetchWorshipIDs(date: String?) async throws -> WorshipsResponse {
        return try await provider.request(api: WorshipAPI.fetchWorshipIDs(date: date))
    }
    
    func fetchBulleinInfo(worshipID: Int) async throws -> BulletinResponse {
        return try await provider.request(api: WorshipAPI.fetchBulletinInfo(worshipID: worshipID))
    }
}
