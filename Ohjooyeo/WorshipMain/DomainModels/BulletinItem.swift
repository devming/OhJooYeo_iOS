//
//  BulletinItem.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import Foundation

struct BulletinItem: Identifiable, Equatable {
    init(
        id: UUID = .init(),
        title: String,
        content: String? = nil,
        assigner: String? = nil
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.assigner = assigner
    }
    
    let id: UUID
    let title: String
    let content: String?
    let assigner: String?
}

extension BulletinItem {
    static func makeDummy() -> [BulletinItem] {
        return [
            BulletinItem(
                title: "찬송",
                content: "은혜",
                assigner: "헤세드"
            ),
            BulletinItem(
                title: "기도",
                assigner: "박재현"
            ),
            BulletinItem(
                title: "성경봉독",
                content: "창 1:1",
                assigner: "헤세드"
            ),
            BulletinItem(
                title: "말씀",
                content: "은혜로운 삶",
                assigner: "목사님"
            )
        ]
    }
}
