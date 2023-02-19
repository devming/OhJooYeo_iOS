//
//  BulletinResponse.swift
//  Ohjooyeo
//
//  Created by devming on 2023/02/19.
//

import Foundation

struct BulletinResponse: Decodable {
    let bulletinOrders: [BulletinItemResponse]
    let emcee: String
}
