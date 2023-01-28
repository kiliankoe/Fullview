import SwiftUI
import KeyboardShortcuts

struct SettingsView: View {
    @Binding var openFullscreen: Bool

    var body: some View {
        Form {
            // TODO: Select light, dark or system color scheme
            LabeledContent("Open new window in full screen:") {
                Toggle("", isOn: $openFullscreen)
            }
            KeyboardShortcuts.Recorder("Open Fullview:", name: .openFullView)
        }
        .padding()
    }
}
