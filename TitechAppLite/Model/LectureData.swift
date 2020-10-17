//
//  LectureData.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/10/03.
//  Copyright © 2020 annin3. All rights reserved.
//

import Foundation

struct LectureData: Identifiable {
    var id: Int
    let date: String
    let lectures: [Lecture]
}
