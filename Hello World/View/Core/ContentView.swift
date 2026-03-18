//
//  ContentView.swift
//  Hello World
//
//  Created by Todd Gibbons on 1/2/25.
//

import SwiftUI

struct SampleAppUIConstants {
    // Layout
    static let animationDuration: TimeInterval = 0.45

    // Console
    static let consoleFontSize: Double = 20
    static let consoleTextColor: Color = .green
    static let consoleMinimizedHeight: CGFloat = 44
    static let consoleVisibleLineCountWhenExpanded: Int = 12
    static let consoleVisibleLineCountWhenMaximized: Int = 40

    // Sliders
    static let handleHeight: CGFloat = 44
    static let trackHeight: CGFloat = 8
    static let cornerRadius: CGFloat = 10
}

struct ContentView: View {
    @Environment(ContentViewModel.self) private var contentViewModel

    var body: some View {
        ZStack {
            Image("BackgroundImage")
            videoPlayerView
        }
        .ignoresSafeArea()
    }

    var videoPlayerView: some View {
        VStack(spacing: 0) {
            Spacer()
            VideoPlayerView()
            Spacer()
        }
    }
}
