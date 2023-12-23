//
//  TimerType.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

enum TimerType: String, CaseIterable {
    case timerA = "Timer A"
    case timerB = "Timer B"
    case timerC = "Timer C"

    var percentageString: String {
        return "10%"
    }
}

extension TimerType: Identifiable {
    var id: Self {
        return self
    }
}
