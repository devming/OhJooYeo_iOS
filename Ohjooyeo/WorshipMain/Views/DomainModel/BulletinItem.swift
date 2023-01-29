//
//  BulletinItem.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import Foundation

struct BulletinItem: Identifiable {
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
