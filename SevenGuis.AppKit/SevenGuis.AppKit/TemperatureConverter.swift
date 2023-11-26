//
//  TemperatureConverter.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 26.11.23.
//

import Foundation

struct TemperatureConverter {
    func toFahrenheit(celsius: Double) -> Double {
        Double(celsius * 9 / 5 + 32)
    }

    func toCelsius(fahrenheit: Double) -> Double {
        Double((fahrenheit - 32) * 5 / 9)
    }
}
