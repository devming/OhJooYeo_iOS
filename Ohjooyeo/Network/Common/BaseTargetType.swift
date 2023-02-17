//
//  BaseTargetType.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/17.
//

import Moya
import Foundation

typealias HTTPHeader = [String: String]


protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        guard let url = URL(string: "") else {
            fatalError("[\(#function)] 잘못된 URL입니다.")
        }
        return url
    }
}
