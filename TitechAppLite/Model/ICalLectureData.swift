//
//  ICalLectureData.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/11/06.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct ICalLectureData {
    var date: Date
    var lectures: [ICalLecture]
}
extension ICalLectureData: Identifiable {
    var id: Date {
        date
    }
}
