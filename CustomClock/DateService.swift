//
//  DateService.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/14.
//

import Foundation
import Combine

class DateService {
    @Published var nyTimeString: String? = nil
    @Published var laTimeString: String? = nil
    @Published var krTimeString: String? = nil
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    private var subscription: AnyCancellable?
    
    let nyDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = TimeZone(identifier: "America/New_York")
        df.locale = Locale(identifier: "ko_KR")
        df.dateStyle = .medium
        df.timeStyle = .medium
        return df
    }()
    
    let laDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = TimeZone(identifier: "America/Los_Angeles")
        df.locale = Locale(identifier: "ko_KR")
        df.dateStyle = .medium
        df.timeStyle = .medium
        return df
    }()
    let krDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateStyle = .medium
        df.timeStyle = .medium
        return df
    }()
    
    
    init() {
//        subscribeTimer()
        dateToString()
    }
//    func subscribeTimer() {
//        subscription = timer.sink(receiveCompletion: { completion in
//            print("타이머 구독 실패: \(completion)")
//        }, receiveValue: {[weak self] output in
//            self?.timeDate = output
//        })
//    }
    
    func dateToString() {
        subscription = timer.sink(receiveValue: { [weak self] date in
            guard let self = self else { return }
            self.nyTimeString = self.nyDateFormatter.string(from: date)
            self.laTimeString = self.laDateFormatter.string(from: date)
            self.krTimeString = self.krDateFormatter.string(from: date)
        })
//        nyTimeString = nyDateFormatter.string(from: timeDate)
//        laTimeString = laDateFormatter.string(from: timeDate)

    }
}
