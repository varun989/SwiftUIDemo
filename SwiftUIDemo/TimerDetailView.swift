//
//  TimerDetailView.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import SwiftUI

struct TimerDetailView: View {
    
    let timerModel: TimerModel

    var body: some View {
        VStack {
            Button(action: {}, label: {
                Spacer()
                Text("Start / Pause")
                    .padding()
                Spacer()
            })
            .border(Color.black)
            .padding(.horizontal)

            Text(timerModel.percentageString)
                .font(.title2)
                .frame(height: 30)
        }
        .navigationTitle(timerModel.type.rawValue)
    }
}

#Preview {
    TimerDetailView(timerModel: TimerModel(type: .timerB))
}
