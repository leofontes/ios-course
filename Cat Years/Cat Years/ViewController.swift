//
//  ViewController.swift
//  Cat Years
//
//  Created by Leonardo Thives da Luz Fontes on 1/16/16.
//  Copyright © 2016 Leo Fontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var input: UITextField!
    @IBOutlet var catAge: UILabel!
    
    @IBAction func submit(_ sender: AnyObject) {
        
        var ageNum = Int(input.text!)!
        
        ageNum = ageNum * 7
        
        catAge.text = "\(ageNum)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

