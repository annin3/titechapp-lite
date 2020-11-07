//
//  ICalClassify.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/31.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct ScheduleTranslator {
    static func translate( icals: [ICalLecture]) -> [ICalLectureData] {
        func dateFormat(date: Date) -> String {
            let f = DateFormatter()
            f.timeZone = TimeZone(identifier: "Asia/Tokyo")
            f.dateStyle = .long
            f.timeStyle = .none
            return f.string(from: date)
         }
        
        var translatedLectures: [ICalLectureData] = []
        
        var preDate: Date?
        var lectureArray = [ICalLecture]()
        
        let sortedICals = icals.sorted {
            $0.startDate < $1.startDate
        }
        
        let today = Date()
        
        for i in 1..<120 {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: today)!
            translatedLectures.append(
                ICalLectureData(date: modifiedDate, lectures: [])
            )
        }
        
        
        
        
        for lecture in sortedICals {
            if let unwrappedPreDate = preDate, dateFormat(date: unwrappedPreDate) != dateFormat(date: lecture.startDate){
                if let i = translatedLectures.firstIndex(where: {dateFormat(date: $0.date) == dateFormat(date: unwrappedPreDate)}) {
                    translatedLectures[i] = ICalLectureData(date: unwrappedPreDate, lectures: lectureArray)
                }
                lectureArray = [ICalLecture]()
            }
            lectureArray.append(lecture)
            preDate = lecture.startDate
        }
        if let unwrappedPreDate = preDate {
            translatedLectures.append(
            ICalLectureData(date: unwrappedPreDate, lectures: lectureArray)
            )
        }
        print(translatedLectures)
        return translatedLectures
    }
}

