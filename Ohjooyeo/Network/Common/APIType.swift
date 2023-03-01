//
//  APIType.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/19.
//

import Foundation
import Alamofire

protocol APIType: URLConvertible {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: Any] { get }
    var version: String { get }
    var encoding: ParameterEncoding { get }
}

extension APIType {
    private var baseUrl: URL {
        return URL(string: "http://aaaicu.iptime.org:9099\(version)\(path)")!
    }
    
    func asURL() throws -> URL {
        return baseUrl
    }
    
    var version: String {
        return ""
    }
    
    var parameters: [String: Any] {
        return [String: Any]()
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    public var baseHeaders: HTTPHeaders? {
        let header = HTTPHeader(name: "Content-Type", value: "application/json")
        return HTTPHeaders(arrayLiteral: header)
    }
}
