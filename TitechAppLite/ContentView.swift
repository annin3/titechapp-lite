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
                .frame(width: 5.0, height: 100.0)
                .foregroundColor(Color("main"))
            VStack(spacing: 21) {
                Text("00:00")
                    .font(.footnote)
                    .foregroundColor(Color("textMain"))
                Text("23:59")
                    .font(.footnote)
                    .foregroundColor(Color("textSub"))
            }
            .padding(.leading)
            VStack(alignment: .leading, spacing: 21) {
                Text("電気的aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    .font(.system(size: 15))
                    .foregroundColor(Color("textMain"))
                    .lineLimit(1)
                Text("week0aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
                    .lineLimit(1)
            }
            .padding(.leading)
            Spacer()
            Text("W000aaaaaaaa")
                .font(.system(size: 14))
                .foregroundColor(Color("main"))
                .lineLimit(2)
                .frame(width: 44)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
