//
//  SecondViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/24/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

class SecondViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, HMAccessoryBrowserDelegate  {

    private var hkBrowser:HMAccessoryBrowser = HMAccessoryBrowser()
    
    var     accessories:[HMAccessory] = []
    
    
    required override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        hkBrowser.delegate = self
        hkBrowser.startSearchingForNewAccessories()
        
        println("Starting search for new accessories")
        
        var existingAcc = hkBrowser.discoveredAccessories
        
        for acc in existingAcc {
            println("Already discovered accessory \(acc)")
            if (acc is HMAccessory) {
                accessories.append(acc as HMAccessory)
            }
        }
        
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        hkBrowser.stopSearchingForNewAccessories()
        
        super.viewDidDisappear(animated)
    }



    // Mark: HMAccessoryBrowserDelegate
    
    
    func accessoryBrowser(browser: HMAccessoryBrowser!, didFindNewAccessory accessory: HMAccessory!) {
           println("Found accessory: \(accessory)")
        
        if let acc = accessory {
            
            var found = false
            var matching = self.accessories.filter({ (item) -> Bool in
                
                if (item.identifier == acc.identifier) {
                    return true
                }
                
                return false
            })
            if (matching.count == 0) {
                let ip = NSIndexPath(forRow: accessories.count, inSection: 0)
                accessories.append(acc)
                self.tableView.insertRowsAtIndexPaths([ip], withRowAnimation: UITableViewRowAnimation.Automatic)
            } else {
                println("accessory already in the list")
            }
        }
        
    }
    
    func accessoryBrowser(browser: HMAccessoryBrowser!, didRemoveNewAccessory accessory: HMAccessory!) {
        println("Accessory gone \(accessory)")
        
        
    }
    
    // MARK: UITableView
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessories.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accessoryCell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        let acc = accessories[indexPath.row]
        
        cell.textLabel?.text = acc.name
        cell.detailTextLabel?.text = acc.description
        
        
        return cell
    }
}

