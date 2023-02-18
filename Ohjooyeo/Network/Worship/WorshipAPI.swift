//
//  WorshipAPI.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/05.
//

import Moya

enum WorshipAPI: BaseTargetType {
    case fetchWorshipIDs(date: String?)
    case fetchBulletinInfo(worshipID: Int)
}

extension WorshipAPI {
    var path: String {
        switch self {
        case let .fetchWorshipIDs(date):
            if let date = date {
                return "/worshipIds/\(date)"
            } else {
                return "/worshipIds"
            }
        case let .fetchBulletinInfo(worshipID):
            return "/bulletin/\(worshipID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchWorshipIDs,
                .fetchBulletinInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchWorshipIDs,
                .fetchBulletinInfo:
            return .requestPlain
        }
    }
    
    var headers: HTTPHeader? {
        return baseHeaders
    }
}

