//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TimersListView(timers: [TimerModel(type: .timerA),
                                    TimerModel(type: .timerB),
                                    TimerModel(type: .timerC)])
        }
    }
}
