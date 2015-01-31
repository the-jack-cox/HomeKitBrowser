//
//  FirstViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/24/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

class FirstViewController: UIViewController, HMHomeManagerDelegate {

    
    var homeManager:HMHomeManager = HMHomeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (homeManager.primaryHome == nil) { // create a primary home
         
            homeManager.addHomeWithName("home", completionHandler: { (home, error) -> Void in
                println("Home added \(error)")
                if (home != nil) {
                    self.homeManager.updatePrimaryHome(home, completionHandler: { (error) -> Void in
                        println("home updated \(error)")
                    })
                }
            })
        }
    }


}

