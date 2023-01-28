import SwiftUI

@main
struct FullviewApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        Settings {
            SettingsView(
                openFullscreen: appState.$openNewWindowsInFullscreen
            )
            .padding()
            .fixedSize()
        }

        MenuBarExtra("Fullview", systemImage: "character.cursor.ibeam") {
            MenuBarView(
                showFullView: { appState.openFullView() },
                showSettings: { appState.openSettings() }
            )
        }
        .menuBarExtraStyle(.menu)
    }
}
