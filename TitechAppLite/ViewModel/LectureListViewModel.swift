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
    private var cancellable: AnyCancellable?
    
    @Published var lecturelist: [ICalLectureData] = []
    
    func appear() {
        cancellable = APIClient().fetch(
            url: UserDefaults.standard.url(forKey: "Url") ?? URL(string:"https://ocwi-mock.titech.app/ocwi/index.php?module=Ocwi&action=Webcal&iCalendarId=test")!
        )
        .map { data in
            ScheduleTranslator.translate(icals: ICalResponseParser.parse(data: data))
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                }
            },
            receiveValue: { lecturelist in
                self.lecturelist = lecturelist
            }
        )
    }
}
