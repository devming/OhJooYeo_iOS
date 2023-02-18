//
//  BulletinResponse.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/18.
//

import Foundation

struct BulletinResponse: Decodable {
    let id: Int
    let title: String
    let roleOwner: String
    let content: String
    let bulletinType: String    // -> Type
    let isStandUp: Bool
    let type: String
    let relatedUrls: [String]
}
