//
//  LectureList.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/09/05.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

struct LectureList: View {
    var body: some View {
        List {
            ForEach(1..<10) {_ in
                    ContentView()
            }
        .listRowInsets(EdgeInsets())
        }
    }
}

struct LectureList_Previews: PreviewProvider {
    static var previews: some View {
        LectureList()
    }
}
