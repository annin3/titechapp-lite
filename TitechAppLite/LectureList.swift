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
        NavigationView {
            List {
                ForEach(0..<10) { _ in
                    Section(header: DataRow()){
                        ForEach(0..<2) { _ in
                            ContentView()
                        }
                    }
                }
                .navigationBarTitle("スケジュール", displayMode: .inline)
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct LectureList_Previews: PreviewProvider {
    static var previews: some View {
        LectureList()
    }
}
