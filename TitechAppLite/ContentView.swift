//
//  ContentView.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/09/05.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 3.0, height: 70.0)
                .foregroundColor(.red)
            Spacer()
            VStack {
                Text("00:00")
                    .font(.footnote)
                Text("23:59")
                    .font(.footnote)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("電気的モデリングとシミュレーション")
                    .font(.subheadline)
                Text("week0")
                    .font(.footnote)
            }
            Spacer()
            Text("W000")
                .font(.footnote)
                .foregroundColor(.red)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
