//
//  TimerType.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

/// Timer types available in the app.
enum TimerType: String{
    case timerA = "Timer A"
    case timerB = "Timer B"
    case timerC = "Timer C"

    var duration: Double {
        switch self {
        case .timerA:
            60
        case .timerB:
            90
        case .timerC:
            120
        }
    }
}

