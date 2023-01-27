import SwiftUI
import KeyboardShortcuts

@main
struct FullviewApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            SettingsView()
        }
        .windowStyle(.hiddenTitleBar)

        MenuBarExtra("Fullview", systemImage: "character.cursor.ibeam") {
            MenuBarView()
        }
        .menuBarExtraStyle(.menu)
    }
}

// MARK: Keyboard Shortcuts

extension KeyboardShortcuts.Name {
    static let openFullView = Self("openFullView")
}

@MainActor
final class AppState: ObservableObject {
    init() {
        KeyboardShortcuts.onKeyUp(for: .openFullView) { [self] in
            FullView().openFullscreen(sender: self)
        }
    }
}
