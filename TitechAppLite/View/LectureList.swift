//
//  LectureList.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/09/05.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

struct LectureList: View {
    @ObservedObject var viewModel = LectureListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.lecturelist) { lecture in
                    Section(header: DateRow(date: lecture.date)) {
                        ForEach(lecture.lectures) { lec in
                            LectureRow(
                                startTime: lec.startTime,
                                finishTime: lec.finishTime,
                                title: lec.title,
                                subtitle: lec.subtitle,
                                room: lec.room
                            )
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("スケジュール", displayMode: .inline)
        }
    }
}

struct LectureList_Previews: PreviewProvider {
    static var previews: some View {
        LectureList()
    }
}
