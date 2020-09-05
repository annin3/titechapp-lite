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
        HStack(spacing: 12) {
            Rectangle()
                .frame(width: 5.0, height: 100.0)
                .foregroundColor(Color("main"))
            VStack(spacing: 21) {
                Text("00:00")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textMain"))
                Text("23:59")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
            }
            VStack(alignment: .leading, spacing: 21) {
                Text("電気的")
                    .font(.system(size: 15))
                    .foregroundColor(Color("textMain"))
                    .lineLimit(1)
                Text("week0")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
                    .lineLimit(1)
            }
            Spacer()
            Text("W000")
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
