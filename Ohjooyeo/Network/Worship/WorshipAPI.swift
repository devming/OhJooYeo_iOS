//
//  WorshipAPI.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/05.
//

import Alamofire

enum WorshipAPI: APIType {
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
    
    var method: HTTPMethod {
        switch self {
        case .fetchWorshipIDs,
                .fetchBulletinInfo:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchWorshipIDs,
                .fetchBulletinInfo:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        return baseHeaders
    }
}

