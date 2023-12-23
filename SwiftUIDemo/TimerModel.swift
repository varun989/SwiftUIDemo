//
//  TimerModel.swift
//  SwiftUIDemo
//
//  Created by Varun Kapoor on 22/12/23.
//

import Foundation

@Observable class TimerModel: Identifiable {

    private var completionPercentage = 0.0


    let id = UUID() //to conform to identifiable
    let type: TimerType

    var percentageString: String {
        return "10%"
    }

    init(type: TimerType) {
        self.type = type
    }

    func startTimer() {

    }

    func pauseTimer() {

    }
}

extension TimerModel: Hashable {

    //Equatable conformance, needed to conform to Hashable
    static func == (lhs: TimerModel, rhs: TimerModel) -> Bool {
        lhs.type == rhs.type
    }

    //Conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}
