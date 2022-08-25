import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    CounterView()
                } label: {
                    Label("Counter", systemImage: "number.circle")
                }
                
                NavigationLink {
                    TemperatureConverterView()
                } label: {
                    Label("Temperature Converter", systemImage: "thermometer.sun.fill")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(width: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
