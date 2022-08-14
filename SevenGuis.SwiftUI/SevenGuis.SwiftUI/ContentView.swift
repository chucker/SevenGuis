//
//  ContentView.swift
//  SevenGuis.SwiftUI
//
//  Created by Sören Kuklau on 14.08.22.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
