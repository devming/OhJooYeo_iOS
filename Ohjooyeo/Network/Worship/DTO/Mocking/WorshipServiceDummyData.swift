//
//  WorshipServiceDummyData.swift
//  Ohjooyeo
//
//  Created by devming on 2023/03/01.
//

import Foundation

extension BulletinResponse {
    static let successResponseData = BulletinResponse(bulletinOrders: [BulletinItemResponse(id: 0, title: "title0", roleOwner: "담당자", content: "test", bulletinType: "BASIC", isStandUp: false, type: "BASIC", relatedUrls: []), BulletinItemResponse(id: 1, title: "시작", roleOwner: "테스트", content: "test", bulletinType: "BASIC", isStandUp: true, type: "BASIC", relatedUrls: []), BulletinItemResponse(id: 2, title: "뭘까", roleOwner: "신난사람", content: "신나", bulletinType: "PRAISE", isStandUp: false, type: "PRAISE", relatedUrls: ["/praise/aaaa,bbb,ccc"]), BulletinItemResponse(id: 3, title: "뭘까", roleOwner: "신난사람", content: "신나", bulletinType: "PRAISE", isStandUp: false, type: "PRAISE", relatedUrls: ["/praise/aaaa", "/praise/bbb", "/praise/ccc"]), BulletinItemResponse(id: 4, title: "뭘까", roleOwner: "신난사람", content: "신나", bulletinType: "PRAISE", isStandUp: false, type: "PRAISE", relatedUrls: ["/praise/aaaa", "/praise/bbb", "/praise/ccc"])], emcee: "test")
}
