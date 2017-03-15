//
//  ChoiceVC.swift
//  Roshambo
//
//  Created by Leonardo Fontes on 14/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class ChoiceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func makeChoice(_ sender: UIButton) {
        let choice: Int = sender.tag
        
        print("insidefront choice is \(choice)")
        
        performSegue(withIdentifier: "choiceSegue", sender: choice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "choiceSegue" {
            let resultVC = segue.destination as? ResultVC
            let choice = sender as? Int
            resultVC?.choice = choice!
        }
    }
}

