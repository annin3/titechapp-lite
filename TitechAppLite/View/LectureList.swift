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
    
    func dateFormat(date: Date) -> String {
        let f = DateFormatter()
        f.timeZone = TimeZone(identifier: "Asia/Tokyo")
        f.dateFormat = "HH:mm"
        return f.string(from: date)
     }
    
    func dateFormat2(date: Date) -> String {
        let f = DateFormatter()
        f.timeZone = TimeZone(identifier: "Asia/Tokyo")
        f.locale = Locale(identifier: "ja_JP")
        f.dateFormat = "MM'月'dd'日 'EEE'曜日"
        return f.string(from: date)
     }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.lecturelist) { lecture in
                    Section(header: DateRow(date: dateFormat2(date: lecture.date))) {
                        ForEach(lecture.lectures) { lec in
                            LectureRow(
                                startTime: dateFormat(date: lec.startDate),
                                finishTime: dateFormat(date: lec.endDate),
                                title: lec.summary,
                                subtitle: lec.description,
                                room: lec.location
                            )
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("スケジュール", displayMode: .inline)
        }
        .onAppear {
            self.viewModel.appear()
        }
    }
}

struct LectureList_Previews: PreviewProvider {
    static var previews: some View {
        LectureList()
    }
}
