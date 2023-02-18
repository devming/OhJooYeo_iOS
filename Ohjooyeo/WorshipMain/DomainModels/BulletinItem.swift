//
//  BulletinItem.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import Foundation

enum WorshipItemType: String, Decodable {
    case basic = "BASIC"
    case praise = "PRAISE"
    case sermon = "SERMON"
    case custom = "CUSTOM"
}

struct BulletinItem: Identifiable, Equatable {
    init(
        id: Int,
        title: String,
        content: String = "",
        roleOwner: String = "",
        isStandUP: Bool = false,
        itemType: String = "BASIC",
        relatedURLs: [String] = []
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.roleOwner = roleOwner
        self.isStandUP = isStandUP
        self.itemType = WorshipItemType(rawValue: itemType) ?? .basic
        self.relatedURLs = relatedURLs
    }
    
    let id: Int
    let title: String
    let content: String
    let roleOwner: String
    let isStandUP: Bool
    let itemType: WorshipItemType
    let relatedURLs: [String]
}

extension BulletinItem {
    static func makeDummy() -> [BulletinItem] {
        return [
            BulletinItem(
                id: 0,
                title: "찬송",
                content: "은혜",
                roleOwner: "헤세드"
            ),
            BulletinItem(
                id: 1,
                title: "기도",
                roleOwner: "박재현"
            ),
            BulletinItem(
                id: 2,
                title: "성경봉독",
                content: "창 1:1",
                roleOwner: "헤세드"
            ),
            BulletinItem(
                id: 3,
                title: "말씀",
                content: "은혜로운 삶",
                roleOwner: "목사님"
            ),
            BulletinItem(
                id: 4,
                title: "봉헌",
                content: "은혜로운 삶",
                roleOwner: "목사님"
            ),
            BulletinItem(
                id: 5,
                title: "봉헌기도",
                roleOwner: "목사님"
            ),
            BulletinItem(
                id: 6,
                title: "광고",
                roleOwner: "사회자"
            ),
            BulletinItem(
                id: 7,
                title: "파송찬양",
                roleOwner: "다같이"
            ),
            BulletinItem(
                id: 8,
                title: "축도",
                roleOwner: "목사님"
            )
        ]
    }
}
