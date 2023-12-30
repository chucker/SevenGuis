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

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return 2
    }

    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView,
              let item = outlineView.item(atRow: outlineView.selectedRow) as? SourceListItem
        else { return }
        
        let namespace = "SevenGuis_AppKit" // FIXME: there's got to be a better way?
        
        let vcClass = Bundle.main.classNamed("\(namespace).\(item.ControllerClassName)") as! NSViewController.Type
        let vc = vcClass.init(nibName: item.NibName, bundle: nil)
        
        DetailViewController = vc
        
        if let oldSubview = detailView.subviews.first{
            oldSubview.removeFromSuperview()
        }
        
        detailView.addSubview(vc.view)
    }
    
    let items = [SourceListItem(Name: "Counter", ControllerClassName: "CounterController", NibName: "CounterView"),
                 SourceListItem(Name: "Temperature Converter", ControllerClassName: "TempConvController", NibName: "TempConvView")]

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return items[index]
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
