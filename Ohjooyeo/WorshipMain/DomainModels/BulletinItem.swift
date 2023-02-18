//
//  BulletinItem.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import Foundation

struct BulletinItem: Identifiable, Equatable {
    init(
        id: Int,
        title: String,
        content: String = "",
        assigner: String = ""
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.assigner = assigner
    }
    
    let id: Int
    let title: String
    let content: String
    let assigner: String
}

extension BulletinItem {
    static func makeDummy() -> [BulletinItem] {
        return [
            BulletinItem(
                id: 0,
                title: "찬송",
                content: "은혜",
                assigner: "헤세드"
            ),
            BulletinItem(
                id: 1,
                title: "기도",
                assigner: "박재현"
            ),
            BulletinItem(
                id: 2,
                title: "성경봉독",
                content: "창 1:1",
                assigner: "헤세드"
            ),
            BulletinItem(
                id: 3,
                title: "말씀",
                content: "은혜로운 삶",
                assigner: "목사님"
            ),
            BulletinItem(
                id: 4,
                title: "봉헌",
                content: "은혜로운 삶",
                assigner: "목사님"
            ),
            BulletinItem(
                id: 5,
                title: "봉헌기도",
                assigner: "목사님"
            ),
            BulletinItem(
                id: 6,
                title: "광고",
                assigner: "사회자"
            ),
            BulletinItem(
                id: 7,
                title: "파송찬양",
                assigner: "다같이"
            ),
            BulletinItem(
                id: 8,
                title: "축도",
                assigner: "목사님"
            )
        ]
    }
}
