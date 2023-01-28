import SwiftUI

struct FullView: View {
    @State var text: String = ""

    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 1000))
                .minimumScaleFactor(0.01)
                .padding(40)

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
        .frame(minWidth: 1000, minHeight: 400)
    }
}
