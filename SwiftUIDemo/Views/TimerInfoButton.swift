//
//  TimerInfoButton.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

/// TimerInfoButton displayed on TimerListView display timers and the %completion
struct TimerInfoButton: View {
    let timerType: TimerType
    let percentageString: String
    let action: () -> Void

    var body: some View {
        ZStack(alignment: .trailing) {
            
            Text(percentageString)
                .padding()

            Button(action: {
                action()
            }, label: {
                Spacer()
                Text(timerType.rawValue)
                Spacer()
            })
            .padding()
        }
        .border(Color.black)
        .padding(.horizontal)
    }
}

#Preview {
    TimerInfoButton(timerType: .timerA, percentageString: "10%", action: {})
}
