//
//  ICalClassify.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/31.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

extension Date {
    func beginningOfDay() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: self)
    }
}

struct ScheduleTranslator {
    static func translate( icals: [ICalLecture]) -> [ICalLectureData] {
        
        var translatedLectures: [ICalLectureData] = []
        
        var preDate: Date?
        var lectureArray = [ICalLecture]()
        
        let sortedICals = icals.sorted {
            $0.startDate < $1.startDate
        }
        
        let today = Date().beginningOfDay()
        for i in 0..<120 {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: today)!
            translatedLectures.append(
                ICalLectureData(date: modifiedDate, lectures: [])
            )
        }
        
        for lecture in sortedICals {
            if let unwrappedPreDate = preDate, unwrappedPreDate.beginningOfDay() != lecture.startDate.beginningOfDay() {
                let elapsedDays = Calendar.current.dateComponents([.day], from: today, to: unwrappedPreDate).day!
                if elapsedDays > 0 {
                    translatedLectures[elapsedDays] = ICalLectureData(date: unwrappedPreDate, lectures: lectureArray)
                }
                lectureArray = [ICalLecture]()
            }
            lectureArray.append(lecture)
            preDate = lecture.startDate
        }
        if let unwrappedPreDate = preDate {
            let elapsedDays = Calendar.current.dateComponents([.day], from: today, to: unwrappedPreDate).day!
            translatedLectures[elapsedDays] = ICalLectureData(date: unwrappedPreDate, lectures: lectureArray)
        }
        return translatedLectures
    }
}
