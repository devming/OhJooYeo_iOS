//
//  NetworkProtocol.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/17.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func request<D: Decodable>(api: APIType) async throws -> D
}

enum APIError: Error, Equatable {
    case unknownError(String?)
    case apiError(String?)
    case invalidJsonError
    case dataDoesntExistError
    case networkError
    
    var localizedDescription: String {
        switch self {
        case .unknownError(let msg):
            return msg ?? "알 수 없는 에러가 발생하였습니다."
        case .apiError(let msg):
            return msg ?? "서버 에러 입니다."
        case .invalidJsonError:
            return "잘못된 데이터를 불러왔습니다."
        case .dataDoesntExistError:
            return "데이터가 없습니다."
        case .networkError:
            return "네트워크 에러입니다."
        }
    }
    
    var alertingType: ErrorAlertType {
        switch self {
        case .unknownError, .networkError:
            return .alertAndRetry
        case .apiError, .invalidJsonError, .dataDoesntExistError:
            return .alert
        }
    }
}

struct ErrorAlertType: OptionSet {
    var rawValue: Int
    
    static let alert = ErrorAlertType(rawValue: 1 << 1)
    static let ignore = ErrorAlertType(rawValue: 1 << 2)
    static let retry = ErrorAlertType(rawValue: 1 << 3)
    
    static let alertAndRetry: ErrorAlertType = [.alert, .retry]
}
