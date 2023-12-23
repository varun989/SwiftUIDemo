//
//  TimersListView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimersListView: View {
    var body: some View {
        VStack {
            ForEach(TimerType.allCases) { timerType in

                TimerInfoButton(timerType: timerType)

            }
        }
        .padding()
    }
}

#Preview {
    TimersListView()
}
