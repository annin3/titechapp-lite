//
//  ICalLecture.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/11/06.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct ICalLecture: Identifiable {
    let id: String
    let startDate: Date
    let endDate: Date
    let summary: String
    let description: String
    let location: String
}
