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
    
    @Published var lecturelist: [LectureData] = [
        LectureData(
            id: 1000,
            data: "10月３日",
            lec: [
                Lecture(
                    id: 100,
                    startTime: "00:00",
                    finishTime: "00:00",
                    title: "AAAA",
                    subtitle: "aaaa",
                    room: "H000"
                )
            ]
        ),
        LectureData(
            id: 1001,
            data: "10月4日",
            lec: [
                Lecture(
                    id: 101,
                    startTime: "00:00",
                    finishTime: "00:00",
                    title: "AAAA",
                    subtitle: "aaaa",
                    room: "H000"
                ),
                Lecture(
                    id: 102,
                    startTime: "00:00",
                    finishTime: "00:00",
                    title: "BBBB",
                    subtitle: "aaaa",
                    room: "H000"
                )
            ]
        ),
        LectureData(
            id: 1002,
            data: "10月5日",
            lec: []
        )
    ]
}
