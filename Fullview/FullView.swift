import SwiftUI

struct FullView: View {
    @Environment(\.colorScheme) private var colorScheme

    @State private var text: String = ""
    @State private var usingMonospacedFont = false
    @State private var localColorScheme: ColorScheme?

    private var backgroundColor: Color {
        if localColorScheme == nil {
            if colorScheme == .light {
                return Color.white
            } else {
                return Color.black
            }
        } else {
            if localColorScheme == .light {
                return Color.white
            } else {
                return Color.black
            }
        }
    }

    private var inputTextField: some View {
        TextField("Start typing...", text: $text)
            .textFieldStyle(.plain)
            .onExitCommand {
                NSApplication.shared.keyWindow?.close()
            }
            .padding()
    }

    private var hiddenControls: some View {
        VStack {
            Toggle("use monospace", isOn: $usingMonospacedFont)
                .keyboardShortcut("m", modifiers: [.command])
                .hidden()

            Button("toggle colorscheme") {
                if localColorScheme == nil {
                    localColorScheme = colorScheme == .light ? .dark : .light
                } else {
                    localColorScheme = localColorScheme == .light ? .dark : .light
                }
            }
            .keyboardShortcut("l", modifiers: [.command])
            .hidden()
        }
    }

    private var helpText: some View {
        Text("⎋ to close Fullview\n⌘L to toggle color scheme\n⌘M to toggle monospaced display")
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
            .padding()
    }

    var body: some View {
        ZStack {
            backgroundColor

            Text(text)
                .font(.system(size: 1000))
                .monospaced(usingMonospacedFont)
                .minimumScaleFactor(0.01)
                .padding(40)

            VStack {
                hiddenControls
                Spacer()
                HStack {
                    inputTextField
                    Spacer()
                    if text.isEmpty {
                        helpText
                    }
                }
            }
        }
        .environment(\.colorScheme, localColorScheme ?? colorScheme)
        .frame(minWidth: 1000, minHeight: 400)
    }
}
