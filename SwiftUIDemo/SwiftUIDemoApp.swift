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
            TimersListView(timersListViewModel: TimersListViewModel(systemScreenBrightness: UIScreen.main.brightness))
        }
    }
}
