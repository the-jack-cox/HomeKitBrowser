//
//  HKBTopicConfigurationCollectionViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/25/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

let reuseIdentifier = "TopicCell"
let homeKey = "Homes"
let roomsSeque = "showRooms"
let accessoryKey = "Accessories"

class HKBTopicConfigurationCollectionViewController: UICollectionViewController {

    var topics = [homeKey, "Scenes", accessoryKey]
     var homeManager:HMHomeManager = HMHomeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView?.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("Doing segue")
        
        switch(sender as String) {
        case homeKey :
            var ctl = segue.destinationViewController as HKBHomeConfigTableViewController
            ctl.homeManager = self.homeManager
        case roomsSeque :
            var ctl = segue.destinationViewController as HKBRoomConfigTableViewController
            ctl.homeManager = self.homeManager
        default :
            println("Default implementation")
            
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return topics.count
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
    
        cell.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel()
        label.text = topics[indexPath.item]
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.blackColor()
        label.userInteractionEnabled = true
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        cell.contentView.addSubview(label)
        cell.contentView.fillWithSubview(label)
        
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Item selected")
        
        switch(topics[indexPath.item]) {
        case homeKey :
            performSegueWithIdentifier("showHomes", sender: topics[indexPath.item])
        case accessoryKey :
            performSegueWithIdentifier("showAccessories", sender: topics[indexPath.item])
        default:
            // do nothing
            println("Doing nothing")
        }
        
    }

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
