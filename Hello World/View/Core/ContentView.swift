//
//  ContentView.swift
//  Hello World
//

import SwiftUI
import MaestroKit

struct ContentView: View {
    @Environment(ContentViewModel.self) private var viewModel
    @FocusState private var isPanelFocused: Bool

    private let panelWidth: CGFloat = 676

    var body: some View {
        ZStack {
            Image("BackgroundImage")
            videoPlayerWithPanel
        }
        .ignoresSafeArea()
        .task {
            await viewModel.start()
        }
    }

    var videoPlayerWithPanel: some View {
        HStack(spacing: 0) {
            // Video player area
            VStack {
                Spacer()
                Image("KP-player_Full")
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .bottomTrailing) {
                        Button("Panels") {
                            withAnimation(.easeInOut(duration: 0.45)) {
                                viewModel.isShowingPanel.toggle()
                            }
                        }
                        .padding()
                    }
                Spacer()
            }
            .focusSection()

            // Maestro Panel
            if viewModel.isShowingPanel {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(white: 0.15))

                    Text("Your content here")
                        .font(.headline)
                        .foregroundColor(.gray)

                    MaestroPanel()
                }
                .frame(width: panelWidth)
                .focused($isPanelFocused)
                .border(Color.red, width: 2)
                .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeInOut(duration: 0.45), value: viewModel.isShowingPanel)
    }
}
