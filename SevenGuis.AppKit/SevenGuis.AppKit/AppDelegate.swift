//
//  AppDelegate.swift
//  SevenGuis.AppKit
//
//  Created by Sören Kuklau on 26.11.23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSOutlineViewDelegate, NSOutlineViewDataSource {
    @IBOutlet var window: NSWindow!
    
    @IBOutlet var detailView: NSView!
    
    /// The current right-hand-side view controller.
    ///
    /// This is required for variable lifetime reasons; otherwise, it gets
    /// cleaned up before it can be called as a delegate.
    var DetailViewController: NSViewController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {}

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return 1
    }

    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView,
              let item = outlineView.item(atRow: outlineView.selectedRow) as? SourceListItem
        else { return }
        
        let vc = TempConvController(nibName: "TempConvView", bundle: nil)
        
        DetailViewController = vc
        
        detailView.addSubview(vc.view)
        
//        detailView.superview?.replaceSubview(detailView, with: vc.view)
        
        
//        let nib = NSNib(nibNamed: "TempConvView", bundle: nil)!
//        let vc = TempConvController()
//        var views: NSArray? = NSArray()
//        nib.instantiate(withOwner: vc, topLevelObjects: &views)
//        detailView.subviews.removeAll()
//        
//        for item in views! {
//            if let view = item as? NSView
//            {
//                detailView.addSubview(view)
//                
////                detailView.superview?.replaceSubview(detailView, with: view)
////                detailView = view
//            }
//        }
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        switch index {
        case 0:
            return SourceListItem(Name: "TempConv")
        default:
            return ""
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "TitleCell")
        
        guard let colIdentifier = tableColumn?.identifier,
              colIdentifier == NSUserInterfaceItemIdentifier(rawValue: "TitleColumn"),
              let cell = outlineView.makeView(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView,
              let sourceListItem = item as? SourceListItem
        else { return nil }
        
        cell.textField!.stringValue = sourceListItem.Name
        
        return cell
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        false
    }
}
