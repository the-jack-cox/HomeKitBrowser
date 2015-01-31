//
//  HKBHomeConfigTableViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/25/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

let homeCell = "homeCell"
let addHomeSegue = "addHome"
class HKBHomeConfigTableViewController: UITableViewController, HMHomeManagerDelegate {
    
    var homeManager:HMHomeManager = HMHomeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addHomePressed:")

        self.navigationItem.rightBarButtonItem = addItem
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        homeManager.delegate = self;
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // make myself the delegate again
        self.homeManager.delegate = self
    }
    
    func addHomePressed(sender: AnyObject!) {
        println("Add home button pressed")
        self.performSegueWithIdentifier(addHomeSegue, sender: sender)
    }
    // MARK: HMHomeManagerDelegate
    
    func homeManagerDidUpdateHomes(manager: HMHomeManager!) {
        println("homes = \(homeManager.homes)")
        self.tableView.reloadData()
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showRoom") {
            let ctl = segue.destinationViewController as HKBRoomConfigTableViewController
            let cell = sender as HKBHomeTableViewCell
            ctl.home = cell.home
        } else if (segue.identifier == addHomeSegue) {
            let ctl = segue.destinationViewController as HKBAddHomeViewController
            ctl.homeManager = self.homeManager
        }
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return homeManager.homes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeCell, forIndexPath: indexPath) as HKBHomeTableViewCell

        
        let home = homeManager.homes[indexPath.row] as HMHome
        cell.home = home
    
        cell.textLabel?.text = home.name
        
        if (home.primary) {
            cell.imageView?.contentMode = UIViewContentMode.ScaleToFill
            cell.imageView?.image = UIImage(named: "1040-checkmark-selected")
        } else {
            cell.imageView?.image = nil;
        }


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
