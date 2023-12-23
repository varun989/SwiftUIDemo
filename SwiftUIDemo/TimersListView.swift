//
//  TimersListView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimersListView: View {

    @State private var presentedScreens: [TimerType] = []

    var body: some View {
        NavigationStack(path: $presentedScreens) {
            VStack {
                ForEach(TimerType.allCases) { timerType in

                    TimerInfoButton(timerType: timerType) {
                        presentedScreens.append(timerType)
                    }
                }
            }
            .padding()
            .navigationDestination(for: TimerType.self) { timerType in
                TimerDetailView(timerType: timerType)
            }
        }
    }
}

#Preview {
    TimersListView()
}
