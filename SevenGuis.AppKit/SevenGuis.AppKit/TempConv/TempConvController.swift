//
//  TempConvController.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 27.11.23.
//

import Cocoa

class TempConvController : NSViewController, NSTextFieldDelegate {
    @IBOutlet var celsius: NSTextField!
    @IBOutlet var fahrenheit: NSTextField!
    
    override func awakeFromNib() {
        print(self)
    }

    override func viewDidLoad() {
        print(self)
    }

    func controlTextDidChange(_ obj: Notification) {
        guard let textField = obj.object as? NSTextField
        else { return }

        let converter = TemperatureConverter()

        if (textField == celsius) {
            fahrenheit.doubleValue = converter.toFahrenheit(celsius: celsius.doubleValue)
        }
        else if (textField == fahrenheit) {
            celsius.doubleValue = converter.toCelsius(fahrenheit: fahrenheit.doubleValue)
        }
    }
}
