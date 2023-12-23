//
//  TimersListView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimersListView: View {

    let timers: [TimerModel]
    @State private var presentedScreens: [TimerModel] = []

    var body: some View {
        NavigationStack(path: $presentedScreens) {
            VStack {
                ForEach(timers) { timerModel in

                    TimerInfoButton(
                        timerType: timerModel.type,
                        percentageString: timerModel.percentageString
                        ) {
                        presentedScreens.append(timerModel)
                    }
                }
            }
            .padding()
            .navigationDestination(for: TimerModel.self) { timerModel in
                TimerDetailView(timerModel: timerModel)
            }
        }
    }
}

#Preview {
    TimersListView(timers:
                    [TimerModel(type: .timerA),
                     TimerModel(type: .timerB),
                     TimerModel(type: .timerC)])
}
