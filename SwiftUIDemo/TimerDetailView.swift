//
//  TimerDetailView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimerDetailView: View {
    
    let timerType: TimerType

    var body: some View {
        VStack {
            Button(action: {}, label: {
                Spacer()
                Text("Start / Pause")
                    .padding()
                Spacer()
            })
            .border(Color.black)

            Text(timerType.percentageString)
                .font(.title2)
                .padding(.top)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TimerDetailView(timerType: .timerA)
}