import SwiftUI

struct CounterView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Current count:")
                Text(String(counter))
            }

            Button("Increment") {
                counter += 1
            }
        }.padding(10)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
