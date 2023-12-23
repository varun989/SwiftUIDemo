//
//  TimerModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

@Observable class TimerModel: Identifiable {

    private var completionPercentage = 0.0
    private var timer: Timer?

    let id = UUID() //to conform to identifiable
    let type: TimerType
    var isTimerActive = false

    var percentageString: String {
        return completionPercentage == 0 ? "" : String(format: "%.0f%%", completionPercentage)
    }

    init(type: TimerType) {
        self.type = type
    }

    func startTimer() {
        if timer == nil {
            initTimer()
        }
        print("Timer: \(type.rawValue) started at \(Date())")
        isTimerActive = true
    }

    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isTimerActive = false
    }

    private func initTimer() {
        let timeInterval = type.duration/100.0  //for eg: timerA takes 60s to go from 0 to 100, should update 1 percent every 60/100th sec

        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { [weak self] timer in
            self?.timerAction()
        })
    }

    private func timerAction() {
        if completionPercentage == 100 {
            return
        }
        completionPercentage += 1

        if completionPercentage == 100 {
            print("Timer: \(type.rawValue) reached 100% at \(Date())")
        }
    }
}

extension TimerModel: Hashable {

    //Equatable conformance, needed to conform to Hashable
    static func == (lhs: TimerModel, rhs: TimerModel) -> Bool {
        lhs.type == rhs.type
    }

    //Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}
