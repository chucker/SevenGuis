//
//  AppDelegate.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 26.11.23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {
    @IBOutlet var window: NSWindow!

    @IBOutlet var celsius: NSTextField!
    @IBOutlet var fahrenheit: NSTextField!

    func applicationDidFinishLaunching(_ aNotification: Notification) {}

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

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
