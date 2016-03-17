//
//  ViewController.swift
//  swift-calculator
//
//  Created by Stephanie on 3/15/16.
//  Copyright © 2016 Stephanie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var operatorSymbols: [UIButton]!
    @IBOutlet var numbers: [UIButton]!
    @IBOutlet var additionalOperators: [UIButton]!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var previousNum = "0"
    var currentNum = ""
    var runningTotal = "0"
    var operation = ""
    
    var isADecimal = false
    var firstTimeThrough = true
    var doneTypingNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorSymbols.forEach(){button in
            button.backgroundColor = UIColor.orangeColor()
            formatButtonBorder(button)
        }
        
        numbers.forEach() { button in
            button.backgroundColor = UIColor.lightGrayColor()
            formatButtonBorder(button)
            
        }
        
        additionalOperators.forEach(){ button in
            button.backgroundColor = UIColor.grayColor()
            formatButtonBorder(button)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func formatButtonBorder(button : UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
    
}


//MARK UI

extension ViewController {
    
    @IBAction func numberPressed(sender: UIButton) {
        
        if(doneTypingNum)
        {
            numberLabel.text = (sender.titleLabel?.text)
        }
        else {
            
            numberLabel.text! += (sender.titleLabel?.text)!
            
            doneTypingNum = false

        }
        
        previousNum = numberLabel.text!

        if (!firstTimeThrough) {
            doMath((sender.titleLabel?.text)!)
            print("math done, running total: \(runningTotal)")

        }
    }
    
    
    @IBAction func operatorPressed(sender: UIButton) {
        
        guard let operationPressed = sender.titleLabel?.text else { return }
        
        doneTypingNum = true
        firstTimeThrough = false

            switch operationPressed
            {
            case "+" :
                operation = "+"
            case "-" :
                operation = "-"
            case "÷" :
                operation = "÷"
            case "×" :
                operation = "×"
            default :
                fatalError()

            }
                print("\(operation)")
    }
    
    
    func doMath(currentNumber: String) {
        
        switch operation
        {
        case "+" :
            print("prev: \(previousNum) \(operation) curr: \(currentNumber) ")
            runningTotal = String( Int(previousNum)! + Int(currentNumber)!)
            print("running total: \(runningTotal)")
        case "-" :
            print("prev: \(previousNum) \(operation) curr: \(currentNumber) ")

            runningTotal = String( Int(previousNum)! - Int(currentNumber)!)
            
            print("running total: \(runningTotal)")

        case "÷" :
            print("prev: \(previousNum) \(operation) curr: \(currentNumber) ")

            runningTotal = String( Int(previousNum)! / Int(currentNumber)!)
            print("running total: \(runningTotal)")

        case "×" :
            print("prev: \(previousNum) \(operation) curr: \(currentNumber) ")

            runningTotal = String( Int(previousNum)! * Int(currentNumber)!)
            print("running total: \(runningTotal)")

        default :
            fatalError()
            
        }
        


    }

    @IBAction func resetAll(sender: UIButton) {
        
        self.numberLabel.text = "0"
        
        previousNum = "0"
        currentNum = ""
        runningTotal = "0"
        operation = ""
        
        isADecimal = false
        firstTimeThrough = true
        doneTypingNum = false

        
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        
        numberLabel.text = runningTotal
    }
    
    
    
    //additiona work: need to support decimals
    //need to figure out how to deal with operators being hit after =
    

}


