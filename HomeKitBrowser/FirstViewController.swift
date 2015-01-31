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
    }


}

