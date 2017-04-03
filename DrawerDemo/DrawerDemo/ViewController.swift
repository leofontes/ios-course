//
//  ViewController.swift
//  DrawerDemo
//
//  Created by Leonardo Fontes on 03/04/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    
    var menuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func menuClicked(_ sender: Any) {
        
        if menuShowing {
            
            menuLeadingConstraint.constant = -250
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        } else {
            menuLeadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShowing = !menuShowing
        
    }


}

