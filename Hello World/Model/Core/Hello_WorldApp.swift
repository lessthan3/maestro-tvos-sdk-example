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
            siteID: "69b2f133e8117ec6536d59a1",
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
