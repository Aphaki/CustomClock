//
//  ViewModel.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/14.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var krTimeString: String?
    @Published var nyTimeString: String?
    @Published var laTimeString: String?
    
    var subscription = Set<AnyCancellable>()
    let timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    let dateService = DateService()
    
    init() {
        subscribeService()
    }
    
    func subscribeService() {
        dateService.$krTimeString
            .sink { completion in
                print("krTimeString 구독 에러")
            } receiveValue: { [weak self] receivedString in
                self?.krTimeString = receivedString
            }
            .store(in: &subscription)
        
        dateService.$nyTimeString
            .sink { completion in
                print("nyTimeString 구독 에러")
            } receiveValue: { [weak self] receivedString in
                self?.nyTimeString = receivedString
            }
            .store(in: &subscription)
        
        dateService.$laTimeString
            .sink { completion in
                print("laTimeString 구독 에러")
            } receiveValue: { [weak self] receivedString in
                self?.laTimeString = receivedString
            }
            .store(in: &subscription)
    }
}
