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
    let bulletinType: String
    let isStandUp: Bool
    let type: String
    let relatedUrls: [String]
}

extension BulletinResponse {
    var toBulletinItem: BulletinItem {
        return BulletinItem(
            id: id,
            title: title,
            content: content,
            roleOwner: roleOwner,
            isStandUP: isStandUp,
            itemType: type,
            relatedURLs: relatedUrls
        )
    }
}
