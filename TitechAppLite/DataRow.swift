//
//  DataRow.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/09/26.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

struct DataRow: View {
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .frame(width: 5.0, height: 55)
                .foregroundColor(Color("grayMain"))
            HStack(spacing: 21) {
                Text("9月28日 土曜日")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
            }
            Spacer()
        }
        .background(Color("backgroundMain"))
    }
}

struct DataRow_Previews: PreviewProvider {
    static var previews: some View {
        DataRow()
    }
}
