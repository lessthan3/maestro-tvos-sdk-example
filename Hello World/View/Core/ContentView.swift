//
//  ContentView.swift
//  Hello World
//

import SwiftUI
import MaestroKit

struct ContentView: View {
    @Environment(ContentViewModel.self) private var viewModel
    @FocusState private var isPanelFocused: Bool

    var body: some View {
        HStack(spacing: 0) {
            // Your app content
            VStack {
                Spacer()
                Text("Your App")
                    .font(.title)
                Button(viewModel.isShowingPanel ? "Hide Panel" : "Show Panel") {
                    viewModel.isShowingPanel.toggle()
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .focusSection()

            // Maestro Panel
            if viewModel.isShowingPanel {
                MaestroPanel()
                    .frame(width: 676)
                    .focused($isPanelFocused)
            }
        }
        .background(Color.black)
        .task {
            await viewModel.start()
        }
    }
}
