//
//  ResultVC.swift
//  Roshambo
//
//  Created by Leonardo Fontes on 14/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImg: UIImageView!
    
    var choice:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        checkGame()
        print("Choice is: \(choice)")
    }
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func checkGame() {
        let computerChoice:Int = Int(arc4random_uniform(2) + 1)
        print("Computerchoice is \(computerChoice)")
        
        if(computerChoice == choice) {
            let img:UIImage = UIImage(named: "itsATie")!
            resultImg.image = img
            
            resultLabel.text = "It's a draw!"
        } else if(computerChoice == 0) {
            if(choice == 1) {
                defImage(code: 0)
                defLabel(winner: "user")
            } else if(choice == 2) {
                defImage(code: 1)
                defLabel(winner: "iphone")
            }
        } else if(computerChoice == 1) {
            if(choice == 0) {
                defImage(code: 0)
                defLabel(winner: "iphone")
            } else if(choice == 2) {
                defImage(code: 2)
                defLabel(winner: "user")
            }
        } else if(computerChoice == 2) {
            if(choice == 0) {
                defImage(code: 1)
                defLabel(winner: "user")
            } else if(choice == 1) {
                defImage(code: 2)
                defLabel(winner: "iphone")
            }
        }
    }
    
    func defLabel(winner: String) {
        if(winner == "user") {
            resultLabel.text = "You won!!!"
        } else {
            resultLabel.text = "iPhone won, suck it Android!!!"
        }
    }
    
    func defImage(code: Int) {
        var img: UIImage
        
        switch code {
        case 0:
            img = UIImage(named: "PaperCoversRock")!
            break
        case 1:
            img = UIImage(named: "RockCrushesScissors")!
            break
        case 2:
            img = UIImage(named: "ScissorsCutPaper")!
            break
        default:
            img = UIImage(named: "PapersCoverRock")!
        }
        
        resultImg.image = img
    }
}
