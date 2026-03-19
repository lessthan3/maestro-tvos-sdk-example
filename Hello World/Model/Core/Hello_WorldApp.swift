//
//  Hello_WorldApp.swift
//  Hello World
//

import SwiftUI
import MaestroKit

@main
struct Hello_WorldApp: App {
    @State private var viewModel = ContentViewModel()

    init() {
        MaestroManager.shared.configure(
            siteID: "695c05610f99e7584a1b7407",
            jwt: "",
            maestroManagerDelegate: AppDelegate(),
            maestroWorkingEnvironment: .prod,
            defaultPanel: .stats
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
                .environment(\.colorScheme, .dark)
        }
    }
}

final class AppDelegate: MaestroManagerDelegate {
    func trackAnalyticsEvent(name: String, attributes: [String: String]) {
        print("Analytics: \(name)")
    }
}
