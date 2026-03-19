//
//  ContentViewModel.swift
//  Hello World
//

import SwiftUI
import MaestroKit

@MainActor
@Observable
class ContentViewModel: MaestroEventDelegate {
    var isShowingPanel = false
    private var eventInterface: MaestroEventInterface?

    func start() async {
        eventInterface = await MaestroManager.shared.userDidStartWatchingEvent(
            eventID: "695c05610f99e7584a1b743e",
            delegate: self,
            hideBetsPanel: false,
            hideBetsWagers: false,
            disableBetsOverlays: false,
            disableFantasyOverlays: false
        )
        isShowingPanel = true
    }

    // MARK: - MaestroEventDelegate

    func userRequestedNewKeyPlaysData() {}
    func playClip(atIndex index: Int) {}
    func shouldShowPanel() { isShowingPanel = true }
    func shouldHidePanel() { isShowingPanel = false }
    func shouldShowOverlay(buttonSize: CGSize, overlayType: OverlayType, payload: MaestroOverlayEvent?) async {}
    func shouldHideOverlay() async {}
    func userViewedPanel(panel: MaestroPanelType) {}
    func trackAction(analytics: [String: String]) {}
    func trackImpression(analytics: [String: String]) {}
    func userRequestedLogin() async {}
    func playPauseButtonPressed() {}
    func shouldShowPanelType(panel: MaestroPanelType) async {}
}
