//
//  HKBHomeConfigTableViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/25/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

let roomCell = "roomCell"
let addRoomSegue = "addRoom"
class HKBRoomConfigTableViewController: UITableViewController {
    
    var homeManager:HMHomeManager = HMHomeManager()
    
    var home:HMHome!

    override func viewDidLoad() {
        super.viewDidLoad()

        var addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRoomPressed:")
        
        self.navigationItem.rightBarButtonItem = addItem
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Rooms in " + (home.name ?? "Undefined")
        
        if (home != nil) {
            self.tableView.reloadData()
        }
    }
    

    func addRoomPressed(sender:AnyObject!) {
        println("Add room pressed")
        
        self.performSegueWithIdentifier(addRoomSegue, sender: sender)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if (segue.identifier == addRoomSegue) {
            let ctl = segue.destinationViewController as HKBAddRoomViewController
            ctl.home = self.home
        }
        
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home?.rooms.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(roomCell, forIndexPath: indexPath) as UITableViewCell

        let room = home.rooms[indexPath.row] as HMRoom
        
        cell.textLabel?.text = room.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */



}
