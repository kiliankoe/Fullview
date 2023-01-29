import SwiftUI
import KeyboardShortcuts

struct SettingsView: View {
    @Binding var openFullscreen: Bool

    var body: some View {
        Form {
            // TODO: Select light, dark or system color scheme
            KeyboardShortcuts.Recorder("Open Fullview:", name: .openFullView)
            LabeledContent("Open new window in full screen:") {
                Toggle("", isOn: $openFullscreen)
            }
        }
        .padding()
    }
}
