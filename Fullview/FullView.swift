import SwiftUI

struct FullView: View {
    @State var text: String = ""

    var body: some View {
        ZStack {
            Color.black

            Text(text)
                .font(.system(size: 1000))
                .minimumScaleFactor(0.01)
                .padding(40)
                .foregroundColor(.white)

            HStack {
                VStack {
                    Spacer()
                    TextField("Start typing...", text: $text)
                        .textFieldStyle(.plain)
                        .onExitCommand {
                            NSApplication.shared.keyWindow?.close()
                        }
                        .padding()
                }
                Spacer()
            }
        }
    }

    @discardableResult
    func openFullscreen(sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let window = NSWindow(contentViewController: controller)
        window.contentViewController = controller
        window.makeKeyAndOrderFront(sender)
        window.toggleFullScreen(sender)
        return window
    }
}
