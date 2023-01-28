import SwiftUI

struct MenuBarView: View {
    var showFullView: () -> Void
    var showSettings: () -> Void

    var body: some View {
        VStack {
            Button("Show Fullview", action: showFullView)
            Button("Settings...", action: showSettings)
            Button("Quit") {
                exit(0)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView(
            showFullView: {},
            showSettings: {}
        )
    }
}
