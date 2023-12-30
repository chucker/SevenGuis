//
//  CounterController.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 30.12.23.
//

import Cocoa

class CounterController: NSViewController {
    @IBOutlet var field: NSTextField!
    
    override func awakeFromNib() {
        guard let field else { return }
        
        field.intValue = 0
    }
    
    @IBAction func countClicked(_ sender: NSButton) {
        guard let field else { return }
        
        field.intValue += 1
    }
}
