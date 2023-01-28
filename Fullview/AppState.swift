import AppKit
import SwiftUI
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let openFullView = Self("openFullView")
}

@MainActor
final class AppState: ObservableObject {
    @AppStorage("open-fullscreen") var openNewWindowsInFullscreen: Bool = true

    init() {
        KeyboardShortcuts.onKeyUp(for: .openFullView) { [weak self] in
            self?.openFullView()
        }
    }

    func openSettings() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }

    func openFullView() {
        let view = FullView()
        self.open(view: view)
    }

    private func open<V: View>(view: V) {
        let controller = NSHostingController(rootView: view)
        let window = NSWindow(contentViewController: controller)
        window.title = "Fullview"
        window.contentViewController = controller
        window.makeKeyAndOrderFront(self)
        if openNewWindowsInFullscreen {
            window.toggleFullScreen(self)
        }
    }
}
