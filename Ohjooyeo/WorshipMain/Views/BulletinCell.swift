//
//  BulletinCell.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import SwiftUI

struct BulletinCell: View {
    let topBottomEdge = EdgeInsets(
        top: 8,
        leading: 8,
        bottom: 8,
        trailing: 8
    )
    
    let item: BulletinItem
    
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.body)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                
                Text(item.assigner)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            if !item.content.isEmpty {
                HStack {
                    Text(item.content)
                        .font(.caption)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(
                    EdgeInsets(
                        top: 1,
                        leading: 0,
                        bottom: 0,
                        trailing: 0
                    )
                )
            }
        }
        .padding(topBottomEdge)
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct BulletinCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BulletinCell(item: .init(id: 0, title: "fff", content: "fsda", assigner: "ddd"))
                .previewLayout(.sizeThatFits)
            
            BulletinCell(item: .init(id: 1, title: "fff", assigner: "ddd"))
                .previewLayout(.sizeThatFits)
        }
    }
}
