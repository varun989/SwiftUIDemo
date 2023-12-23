//
//  TimersListView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI
import MediaPlayer

struct TimersListView: View {

    var timersListViewModel: TimersListViewModel

    @State private var presentedScreens: [TimerModel] = []

    var body: some View {
        NavigationStack(path: $presentedScreens) {
            VStack {
                ForEach(timersListViewModel.timerModels) { timerModel in

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
        .onChange(of: timersListViewModel.screenDarkness) { oldValue, newValue in
            UIScreen.main.brightness = newValue
        }
        .onChange(of: timersListViewModel.systemVolume) { oldValue, newValue in
            MPVolumeView.setVolume(newValue)
        }
    }
}

#Preview {
    TimersListView(timersListViewModel: TimersListViewModel(systemScreenBrightness: UIScreen.main.brightness))
}
