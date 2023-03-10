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
            print("π’                          π’")
            print("π’ Success Network Response π’")
            print("π’                          π’")
            print("π¦ \(request)")
            return request
        } catch {
            print("")
            print("π¨                          π¨")
            print("π¨ Failure Network Responsa π¨")
            print("π¨                          π¨")
            guard let error = error as? AFError else {
                throw APIError.unknownError(nil)
            }
            // TODO: μ¬κΈ°μ μμΈν μλ¬λ΄μ©μ firebase eventλ‘ μΆμ νλ©΄ μ’μλ―(crashlyticsλ κ³Όν λ―)
            
            switch error {
                // JSON decoding μ€ν¨λ κ°μ₯ λΉλ²ν΄μ λ³λ μ²λ¦¬
            case let .responseSerializationFailed(decodeError):
                if case let .decodingFailed(error) = decodeError,
                   let error = error as? DecodingError {
                    if case let .typeMismatch(_, context) = error {
                        print("π» Mispatching type π»")
                        print("Coding Path Hint: \(context.codingPath)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .valueNotFound(_, context) = error {
                        print("π» Value Not Found π»")
                        print("Coding Path Hint: \(context.codingPath)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .keyNotFound(codingKey, context) = error {
                        print("π» Key Not Found π»")
                        print("Coding Key Hint: \(codingKey)")
                        print("Debug Message: \(context.debugDescription)")
                    } else if case let .dataCorrupted(context) = error {
                        print("π» Data Corrupted π»")
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

extension Error {
    var localizedDescription: String {
        guard let error = self as? APIError else {
            return APIError.unknownError(nil).localizedDescription
        }
        return error.localizedDescription
    }
}
