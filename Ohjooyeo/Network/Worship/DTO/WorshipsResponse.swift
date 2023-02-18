//
//  WorshipsResponse.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/18.
//

import Foundation
import Moya

struct WorshipsResponse: Decodable {
    var worships: [WorshipResponse]
}
