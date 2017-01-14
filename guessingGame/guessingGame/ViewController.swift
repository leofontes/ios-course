//
//  ViewController.swift
//  guessingGame
//
//  Created by Leonardo Thives da Luz Fontes on 1/19/16.
//  Copyright © 2016 Leo Fontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var iphoneScore: UILabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var numberOfFingers: UILabel!
    @IBOutlet var result: UILabel!
    
    
    @IBAction func submit(_ sender: AnyObject) {
        let value:UInt32 = UInt32(input.text!)!
        let randFingersUp = arc4random_uniform(5) + 1
        
        numberOfFingers.text = "\(randFingersUp) fingers up"
        
        if(value == randFingersUp) {
            result.text = "You win! Nice guess"
            var playerScoreTmp = Int(playerScore.text!)
            playerScoreTmp = playerScoreTmp! + 1
            playerScore.text = String(playerScoreTmp!)
        } else {
            result.text = "You lose! Nice try"
            var iphoneScoreTmp = Int(iphoneScore.text!)
            iphoneScoreTmp = iphoneScoreTmp! + 1
            iphoneScore.text = String(iphoneScoreTmp!)
        }
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

