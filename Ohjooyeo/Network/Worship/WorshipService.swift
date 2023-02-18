//
//  WorshipService.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/18.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol WorshipService {
    var provider: MoyaProvider<WorshipAPI> { get set }
    
    func fetchWorshipIDs(date: String?) -> AnyPublisher<WorshipsResponse, MoyaError>
    func fetchBulleinInfo(worshipID: Int) -> AnyPublisher<BulletinItem, MoyaError>
}
