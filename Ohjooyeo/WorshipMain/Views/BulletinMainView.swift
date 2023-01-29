//
//  BulletinMainView.swift
//  Ohjooyeo
//
//  Created by devming on 2023/01/29.
//

import SwiftUI

struct BulletinMainView: View {
    var body: some View {
        LazyVStack {
            BulletinCell()
            BulletinCell()
            BulletinCell()
            BulletinCell()
        }
        .padding()
    }
}

struct BulletinMainView_Previews: PreviewProvider {
    static var previews: some View {
        BulletinMainView()
    }
}
