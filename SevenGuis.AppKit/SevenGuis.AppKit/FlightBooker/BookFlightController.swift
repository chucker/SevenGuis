//
//  BookFlightController.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 31.12.23.
//

import Cocoa

class BookFlightController: NSViewController {
    @IBOutlet var mode: NSComboBox!
    @IBOutlet var startDate: NSDatePicker!
    @IBOutlet var returnDate: NSDatePicker!
    @IBOutlet var bookButton: NSButton!

    @objc dynamic var startDateValue: Date? {
        didSet {
            validate()
        }
    }

    @objc dynamic var returnDateValue: Date? {
        didSet {
            validate()
        }
    }

    override func awakeFromNib() {
        validate()
    }

    func validate() {
        switch mode.stringValue {
        case "return flight":
            returnDate.isEnabled = true
            bookButton.isEnabled = startDateValue != nil
                && returnDateValue != nil
                && returnDateValue! > startDateValue!
        default:
            returnDate.isEnabled = false
            bookButton.isEnabled = startDateValue != nil
        }
    }
}

extension BookFlightController: NSComboBoxDelegate {
    func comboBoxSelectionDidChange(_ notification: Notification) {
        validate()
    }
}
