import SwiftUI
import KeyboardShortcuts

struct SettingsView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Open Fullview:", name: .openFullView)
        }
        .padding()
    }
}
