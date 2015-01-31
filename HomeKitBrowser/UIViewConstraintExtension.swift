//
//  UIViewConstraintExtension.swift
//  CiS
//
//  Created by Jack Cox on 11/11/14.
//  Copyright (c) 2014 ChristInSong. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillWithSubview(view:UIView) -> NSArray {
    
        return self.fillWithSubview(view, margin: UIEdgeInsets(top: 0,
            left: 0, bottom: 0, right: 0))
    
    }
    
    func fillWithSubview(view:UIView, margin:UIEdgeInsets) -> NSArray {
    
        // make the view a subview of the receiver view
        if (view.superview != self) {
            self.addSubview(view)
        }
        // turn off auto resizing mask
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // create the constraints
        var constraints = [
            NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: margin.top),
            NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: -margin.bottom),
            NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: -margin.left),
            NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: margin.right)
        ]
        // add the constraints
        self.addConstraints(constraints)
        return constraints
    
    }
    
    func pinSubviewToBottom(view:UIView) ->[NSLayoutConstraint] {
        
        return self.pinSubviewToBottom(view, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    func pinSubviewToBottom(view:UIView, margin:UIEdgeInsets) -> [NSLayoutConstraint] {
        // make the view a subview of the receiver view
        if (view.superview != self) {
            self.addSubview(view)
        }
        // turn off auto resizing mask
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // create the constraints
        var constraints = [
            NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: -margin.bottom),
            NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: -margin.left),
            NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: margin.right)
        ]
        // add the constraints
        self.addConstraints(constraints)
        return constraints
        
    }
    
    func pinSubviewToTop(view:UIView) ->NSArray {
        
        return self.pinSubviewToTop(view, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    func pinSubviewToTop(view:UIView, margin:UIEdgeInsets) -> NSArray {
        // make the view a subview of the receiver view
        if (view.superview != self) {
            self.addSubview(view)
        }
        // turn off auto resizing mask
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // create the constraints
        var constraints = [
            NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: margin.top),
            NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: -margin.left),
            NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: margin.right)
        ]
        // add the constraints
        self.addConstraints(constraints)
        return constraints
        
    }
    
    func setVerticalSpacing(topView:UIView, bottomView:UIView) -> NSArray {
        return self.setVerticalSpacing(topView, bottomView: bottomView, gap:0.0)
    }
    
    func setVerticalSpacing(topView:UIView, bottomView:UIView, gap:CGFloat) -> NSArray {
        
        var constraints = [
            NSLayoutConstraint(item: topView, attribute: .Bottom,
                relatedBy: .Equal,
                toItem: bottomView,
                attribute: .Top,
                multiplier: 1,
                constant: gap)
        ]
        
        self.addConstraints(constraints)
        return constraints
        
    }
    
}

