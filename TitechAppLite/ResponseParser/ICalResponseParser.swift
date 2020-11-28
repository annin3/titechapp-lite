//
//  iCalResponseParser.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/17.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct ICalResponseParser {
    static func parse (data: Data) -> [ICalLecture] {
        guard let str = String(data: data, encoding: .utf8) else {
            return []
        }
        
        let arr = Array(str.components(separatedBy: "BEGIN:VEVENT").dropFirst())
        
        var text: String?
        var startDate: Date?
        var endDate: Date?
        var location: String?
        var description: String?
        var summary: String?
        var id: String?
        
        var iCalLectures: [ICalLecture] = []
        
        for lecture in arr {
            lecture.enumerateLines {
                line, stop in
                if line.hasPrefix("DTSTART") { // -> true
                    text = line
                        .replacingOccurrences(of:"DTSTART;TZID=Asia/Tokyo:", with:"")
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
                    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
                    guard let unwrappedText = text else { return }
                    startDate = dateFormatter.date(from: unwrappedText)
                    
                } else if line.hasPrefix("DTEND") { // -> true
                    text = line
                        .replacingOccurrences(of:"DTEND;TZID=Asia/Tokyo:", with:"")
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
                    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
                    guard let unwrappedText = text else { return }
                    endDate = dateFormatter.date(from: unwrappedText)
                    
                } else if line.hasPrefix("LOCATION") { // -> true
                    location = line
                        .replacingOccurrences(of:"LOCATION:", with:"")
                    
                } else if line.hasPrefix("DESCRIPTION") { // -> true
                    description = line
                        .replacingOccurrences(of:"DESCRIPTION:", with:"")
                    
                } else if line.hasPrefix("SUMMARY") { // -> true
                    summary = line
                        .replacingOccurrences(of:"SUMMARY:", with:"")
                    
                } else if line.hasPrefix("UID") { // -> true
                    id = line
                        .replacingOccurrences(of:"UID:", with:"")
                        .replacingOccurrences(of:"@ocw.titech.ac.jp", with:"")
                    
                } else if line.hasPrefix("END:VEVENT") { // -> true
                    guard let unwrappedId = id, let unwrappedStartDate = startDate, let unwrappedEndDate = endDate, let unwrappedSummary = summary else {
                        return
                    }
                    iCalLectures.append(
                        ICalLecture(
                            id: unwrappedId,
                            startDate: unwrappedStartDate,
                            endDate: unwrappedEndDate,
                            summary: unwrappedSummary,
                            description: description ?? "",
                            location: location ?? ""
                        )
                    )
                    text = nil
                    startDate = nil
                    endDate = nil
                    location = nil
                    description = nil
                    summary = nil
                    id = nil
                }
            }
        }
        return iCalLectures
    }
    
}
