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
        
        return try await session.request(
            api.asURL(),
            method: api.method,
            parameters: api.parameters,
            encoding: api.encoding,
            headers: httpHeaders
        )
        .serializingDecodable(D.self, decoder: jsonDecoder)
        .value
    }
}
