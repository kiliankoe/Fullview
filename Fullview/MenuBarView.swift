import SwiftUI

struct MenuBarView: View {
    var body: some View {
        VStack {
            Button("Show Fullview") {
                FullView().openFullscreen(sender: self)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
