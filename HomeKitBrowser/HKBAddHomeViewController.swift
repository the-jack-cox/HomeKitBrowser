//
//  HKBAddRoomViewController.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/31/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

class HKBAddHomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var homeNameField: UITextField!
    @IBOutlet weak var primarySwitch: UISwitch!
    
    var homeManager:HMHomeManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        
        if let realHomeManager = self.homeManager {
            realHomeManager.addHomeWithName(homeNameField.text) {(home, error) in
                
                if (self.primarySwitch.on) {
                    realHomeManager.updatePrimaryHome(home, completionHandler: { (error) -> Void in
                        if (error != nil) {
                            var alertCtl = UIAlertController(title: "Error",
                                message: "Error adding home \(self.homeNameField.text)\n\(error.localizedDescription)",
                                preferredStyle: UIAlertControllerStyle.Alert)
                            alertCtl.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                                // Do something appropriate
                            }))
                            self.presentViewController(alertCtl, animated: true, completion: nil)
                        } else {
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }
                    })
                } else {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
        
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text.isEmpty) {
            self.doneButton.enabled = false
        } else {
            self.doneButton.enabled = true
        }
        
        return true
    }

}
