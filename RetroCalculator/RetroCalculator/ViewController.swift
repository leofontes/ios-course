//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Leo Fontes on 02/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var btnSound: AVAudioPlayer!
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation:String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func onClearPressed(sender: UIButton) {
        currentOperation = Operation.Empty
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        result = ""
        
        outputLbl.text = "0"
    }
    
    func playSound() {
        if(btnSound.isPlaying) {
            btnSound.stop()
        }
        
        btnSound.play()
    }

    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            
            //If a user selected a operator but then selected another operator without selecting a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\( Double(leftValStr)! * Double(rightValStr)! )"
                } else if currentOperation == Operation.Divide {
                    result = "\( Double(leftValStr)! / Double(rightValStr)! )"
                } else if currentOperation == Operation.Subtract {
                    result = "\( Double(leftValStr)! - Double(rightValStr)! )"
                } else if currentOperation == Operation.Add {
                    result = "\( Double(leftValStr)! + Double(rightValStr)! )"
                }
                
                leftValStr = result
                outputLbl.text = result
                
            }
            
            currentOperation = operation
        } else {
            //This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

