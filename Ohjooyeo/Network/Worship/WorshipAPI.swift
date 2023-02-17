//
//  WorshipAPI.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/05.
//

import Moya

enum WorshipAPI: BaseTargetType {
    case fetchWorshipInfo
}

extension WorshipAPI {
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: HTTPHeader? {
        return nil
    }
}

