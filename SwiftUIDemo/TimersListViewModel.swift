//
//  TimersListViewModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

@Observable class TimersListViewModel {

    var systemScreenBrightness: CGFloat
    var timerModels = [TimerModel]()

    init(systemScreenBrightness: CGFloat) {
        self.systemScreenBrightness = systemScreenBrightness
        timerModels = [TimerModel(type: .timerA, delegate: self),
        TimerModel(type: .timerB),
        TimerModel(type: .timerC)]
    }
}
