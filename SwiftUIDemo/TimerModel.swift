//
//  TimerModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

@Observable class TimerModel: Identifiable {

    private var completionPercentage = 0.0

    let type: TimerType

    var percentageString: String {
        return "10%"
    }

    init(type: TimerType) {
        self.type = type
    }

    func startTimer() {

    }

    func pauseTimer() {

    }
}

