//
//  Lecture.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/03.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct Lecture: Identifiable {
    let id: Int
    let startTime: String
    let finishTime: String
    let title: String
    let subtitle: String
    let room: String
}
