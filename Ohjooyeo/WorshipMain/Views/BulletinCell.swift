//
//  BulletinCell.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import SwiftUI

struct BulletinCell: View {
    let sideEdge = EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 0,
        trailing: 16
    )
    
    let topBottomEdge = EdgeInsets(
        top: 8,
        leading: 0,
        bottom: 8,
        trailing: 0
    )
    
    var body: some View {
        VStack {
            HStack {
                Text("성경 봉독")
                    .font(.body)
                    .bold()
                Spacer()
                Text("사회자")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(sideEdge)
            
            Spacer()
            
            HStack {
                Text("내용")
                    .font(.caption)
                Spacer()
            }
            .padding(sideEdge)
        }
        .padding(topBottomEdge)
        .background(.white)
        .cornerRadius(8)
    }
}

struct BulletinCell_Previews: PreviewProvider {
    static var previews: some View {
        BulletinCell()
            .previewLayout(.fixed(width: 375.0, height: 80.0))
            .previewLayout(.sizeThatFits)
    }
}
