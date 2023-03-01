//
//  NetworkManager.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/19.
//

import Alamofire
import Foundation

class NetworkManager: NetworkProtocol {
    
    static let shared = NetworkManager()
    
    private init() {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        self.jsonDecoder = decoder
    }
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Session(configuration: configuration)
    }()
    
    private let jsonDecoder: JSONDecoder
    
    func request<D: Decodable>(api: APIType) async throws -> D {
        
        var httpHeaders = api.baseHeaders
        if let headers = api.headers {
            headers.forEach { header in
                httpHeaders?.add(header)
            }
        }
        
        do {
            let request = try await session.request(
                api.asURL(),
                method: api.method,
                parameters: api.parameters,
                encoding: api.encoding,
                headers: httpHeaders
            )
            .serializingDecodable(D.self, decoder: jsonDecoder)
            .value
            
            print("")
            print("🟢                          🟢")
            print("🟢 Success Network Response 🟢")
            print("🟢                          🟢")
            
            return request
        } catch {
            print("")
            print("🚨                          🚨")
            print("🚨 Failure Network Responsa 🚨")
            print("🚨                          🚨")
            guard let error = error as? AFError else {
                throw APIError.unknownError(nil)
            }
            // TODO: 여기서 상세한 에러내용을 firebase event로 추적하면 좋을듯(crashlytics는 과할듯)
            
            switch error {
                // JSON decoding 실패는 가장 빈번해서 별도 처리
            case let .responseSerializationFailed(decodeError):
                if case let .decodingFailed(error) = decodeError,
                   let error = error as? DecodingError {
                    if case let .typeMismatch(_, context) = error {
                        print("🔻 Mispatching type 🔻")
                        print("Coding Path Hint: \(context.codingPath)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .valueNotFound(_, context) = error {
                        print("🔻 Value Not Found 🔻")
                        print("Coding Path Hint: \(context.codingPath)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .keyNotFound(codingKey, context) = error {
                        print("🔻 Key Not Found 🔻")
                        print("Coding Key Hint: \(codingKey)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .dataCorrupted(context) = error {
                        print("🔻 Data Corrupted 🔻")
                        print("Coding Path Hint: \(context.codingPath)")
                        print("Debug Message: \(context.debugDescription)")
                    }
                }
                throw APIError.invalidJsonError
            default:
                throw APIError.apiError(nil)
            }
        }
    }
}
