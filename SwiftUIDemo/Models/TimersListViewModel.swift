//
//  TimersListViewModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation


protocol UpdateSystemValuesProtocol: AnyObject {
    func screenBrightnessValueUpdated(value: CGFloat)
    func volumeValueUpdated(value: Float)
}

@Observable class TimersListViewModel {

    var systemScreenBrightness: CGFloat
    var systemVolume: Float
    var timerModels = [TimerModel]()

    var screenDarkness: CGFloat {
        1-systemScreenBrightness    //screen darkness: inverse of screen brightness
    }

    init(systemScreenBrightness: CGFloat) {
        self.systemScreenBrightness = systemScreenBrightness
        self.systemVolume = 0
        timerModels = [TimerModel(type: .timerA, delegate: self),
        TimerModel(type: .timerB, delegate: self),
        TimerModel(type: .timerC)]
    }
}

extension TimersListViewModel: UpdateSystemValuesProtocol {
    //MARK: Conformance to UpdateSystemValuesProtocol
    func screenBrightnessValueUpdated(value: CGFloat) {
        systemScreenBrightness = value
    }
    
    func volumeValueUpdated(value: Float) {
        systemVolume = value
    }
    

}
