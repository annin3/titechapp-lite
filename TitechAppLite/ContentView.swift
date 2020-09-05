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
                .foregroundColor(Color("main"))
            VStack {
                Text("00:00")
                    .font(.footnote)
                    .foregroundColor(Color("textMain"))
                Text("23:59")
                    .font(.footnote)
                    .foregroundColor(Color("textSub"))
                    .padding(.top)
            }
            .padding(.leading)
            VStack(alignment: .leading) {
                Text("電気的")
                    .font(.system(size: 15))
                    .foregroundColor(Color("textMain"))
                Text("week0")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
                    .padding(.top)
            }
            .padding(.leading)
            Spacer()
            Text("W000")
                .font(.system(size: 14))
                .foregroundColor(Color("main"))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
