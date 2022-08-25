//
//  TemperatureConverterView.swift
//  SevenGuis.SwiftUI
//
//  Created by Sören Kuklau on 25.08.22.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State private var celsius : Double = 0
    @State private var fahrenheit : Double = 0

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), alignment: .trailing),
            GridItem(.flexible(), alignment: .leading)
        ]) {
            Text("Celsius")
            TextField("Celsius", value: $celsius, formatter: NumberFormatter())
                .frame(width: 100)
                .onChange(of: celsius) { newValue in
                    fahrenheit = Measurement(value: newValue, unit: UnitTemperature.celsius).converted(to: UnitTemperature.fahrenheit).value
                }

            Text("Fahrenheit")
            TextField("Fahrenheit", value: $fahrenheit, formatter: NumberFormatter())
                .frame(width: 100)
                .onChange(of: fahrenheit) { newValue in
                    celsius = Measurement(value: newValue, unit: UnitTemperature.fahrenheit).converted(to: UnitTemperature.celsius).value
                }
        }.frame(minWidth: 250)
    }
}

struct TemperatureConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConverterView()
    }
}
