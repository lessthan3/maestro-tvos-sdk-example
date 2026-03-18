//
//  Hello_WorldApp.swift
//  Hello World
//
//  Created by Todd Gibbons on 1/2/25.
//

import SwiftUI

@main
struct Hello_WorldApp: App {
    @State private var contentViewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color(red: 0.03, green: 0.03, blue: 0.07))
                .environment(contentViewModel)
                .environment(\.colorScheme, .dark)
        }
    }
}
