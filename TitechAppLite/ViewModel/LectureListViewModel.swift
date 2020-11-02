//
//  LectureListViewModel.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/03.
//  Copyright © 2020 annin3. All rights reserved.
//
import Foundation
import Combine

class LectureListViewModel: ObservableObject {
    
    @Published var lecturelist: [ICalLectureData] = ScheduleTranslator.translate(icals: ICalResponseParser.parse(data: iCaldata.data(using: .utf8)!))
}
