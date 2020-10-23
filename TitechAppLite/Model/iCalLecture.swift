//
//  iCalLecture.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/22.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct iCalLecture: Identifiable {
    let id: String
    let startTime: String
    let endTime: String
    let summary: String
    let description: String
    let location: String
}
