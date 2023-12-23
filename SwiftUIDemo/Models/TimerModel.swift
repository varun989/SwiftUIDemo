//
//  TimerModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

/// Allows to start / pause a timer, calculates timer completion% String for display, 
/// handles timer fire actions
/// and updates TimersListViewModel to update system screen brightness/darkness and volume.
@Observable class TimerModel: Identifiable {

    private var completionPercentage = 0.0
    private var timer: Timer?

    let id = UUID() //to conform to identifiable
    let type: TimerType
    weak var delegate: UpdateSystemValuesProtocol?
    var isTimerActive = false

    var percentageString: String {
        return completionPercentage == 0 ? "" : String(format: "%.0f%%", completionPercentage)
    }

    //MARK: Init
    init(type: TimerType, delegate: UpdateSystemValuesProtocol? = nil) {
        self.type = type
        self.delegate = delegate
    }

    //MARK: Timer Start / Pause Actions
    /// Starts the timer, initializes it first if nil
    func startTimer() {
        if timer == nil {
            initTimer()
        }
        print("Timer: \(type.rawValue) started at \(Date())")
        isTimerActive = true
    }

    /// Pauses the timer
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        print("Timer: \(type.rawValue) paused at \(Date())")
        isTimerActive = false
    }

    //MARK: Private Methods
    /// Initialize a timer based on the TimerType duration
    private func initTimer() {
        let timeInterval = type.duration/100.0  //for eg: timerA takes 60s to go from 0 to 100, should update 1 percent every 60/100th sec

        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { [weak self] timer in
            self?.timerAction()
        })
    }

    /// Action executed when timer fires
    private func timerAction() {
        if completionPercentage == 100 {
            return
        }
        completionPercentage += 1

        if type == .timerA, completionPercentage > 20 {
            //When timer A is greater than 20%, start matching the screen darkness level to timer A: get the updated brightness level and calculate darkness before triggering UI update
            if let delegate {
                delegate.screenBrightnessValueUpdated(value: (completionPercentage/100)) 
            }
        }

        if type == .timerB {
            //Update system volume% with timerB
            if let delegate {
                delegate.volumeValueUpdated(value: (Float(completionPercentage)/100))
            }
        }

        if completionPercentage == 100 {
            print("Timer: \(type.rawValue) reached 100% at \(Date())")
        }
    }
}

extension TimerModel: Hashable {
    //MARK: Conformance to Hashable
    
    //Equatable conformance, needed to conform to Hashable
    static func == (lhs: TimerModel, rhs: TimerModel) -> Bool {
        lhs.type == rhs.type
    }

    //Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
