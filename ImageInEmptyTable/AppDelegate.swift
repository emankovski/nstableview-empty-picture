//
//  AppDelegate.swift
//  ImageInEmptyTable
//
//  Created by Eugene Node on 6/29/16.
//  Copyright © 2016 Eugene Mankovski. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource {

    private static let placeholder = "<Placeholder>"
    dynamic var items = [String]()
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var imageCell: NSTableCellView!

    @IBAction func addRowsPressed(sender: AnyObject) {
        appendItems()
    }

    @IBAction func clearTablePressed(sender: AnyObject) {
        removeItems()
        
    }
   
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        appendItems()
    
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func appendItems() {
        
        
        items.removeAll()
        
        items.append("One")
        items.append("Two")
        items.append("Three")
        
        tableView.rowHeight = 20
        
    }
    
    func removeItems() {
     
        items.removeAll()
        tableView.rowHeight = 50
        items.append(AppDelegate.placeholder)

        
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if items[row] == AppDelegate.placeholder {
            
            return imageCell
        }
        
        let cellView = tableView.makeViewWithIdentifier("CellView", owner: nil) as! NSTableCellView

        return cellView
    }


}


