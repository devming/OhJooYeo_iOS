//
//  WorshipServiceMock.swift
//  Ohjooyeo
//
//  Created by devming on 2023/03/01.
//

import Foundation

struct WorshipServiceMock: WorshipService {
    
    func fetchWorshipIDs(date: String?) async throws -> WorshipsResponse {
        return WorshipsResponse(worships: [])
    }
    
    func fetchBulleinInfo(worshipID: Int) async throws -> BulletinResponse {
        return await MainActor.run {
            return BulletinResponse.successResponseData
        }
    }
}
