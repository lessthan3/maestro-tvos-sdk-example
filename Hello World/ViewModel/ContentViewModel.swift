//
//  ContentViewModel.swift
//  Hello World
//
//  Created by Todd Gibbons on 2/7/25.
//

import SwiftUI
import Observation

@MainActor
@Observable
class ContentViewModel {
    var isShowingPlayer: Bool

    init() {
        self.isShowingPlayer = true
    }
}
