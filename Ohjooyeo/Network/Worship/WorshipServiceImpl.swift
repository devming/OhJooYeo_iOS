//
//  WorshipServiceImpl.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/05.
//

import Foundation
import Moya
import CombineMoya
import Combine

struct WorshipServiceImpl: WorshipService {
    var provider: MoyaProvider<WorshipAPI>
    
    init(provider: MoyaProvider<WorshipAPI>) {
        self.provider = provider
    }
    
    func fetchWorshipIDs(date: String?) -> AnyPublisher<WorshipsResponse, MoyaError> {
        return provider.requestPublisher(.fetchWorshipIDs(date: date))
            .map(WorshipsResponse.self)
            .eraseToAnyPublisher()
    }
    
    func fetchBulleinInfo(worshipID: Int) -> AnyPublisher<BulletinResponse, MoyaError> {
        return provider.requestPublisher(.fetchBulletinInfo(worshipID: worshipID))
            .map(BulletinResponse.self)
            .eraseToAnyPublisher()
    }
}
