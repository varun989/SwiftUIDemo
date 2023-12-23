//
//  TimerInfoButton.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimerInfoButton: View {
    let timerType: TimerType
    let action: () -> Void

    var body: some View {
        ZStack(alignment: .trailing) {
            
            Text(timerType.percentageString)
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
    TimerInfoButton(timerType: .timerA, action: {})
}
