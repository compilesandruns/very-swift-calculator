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
    
    
    var accumulation: Double = 0.0
    var currentResult: Double = 0.0
    
    var firstTimeThrough = true
    
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
    
    //FORMATTING
    
    func formatButtonBorder(button : UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
    
    
    //OPERATIONS
    
    @IBAction func showNum(sender: UIButton) {
        
        guard let text = sender.titleLabel?.text else { return }
        
        switch text {
        case ".":
            numberLabel.text! += text
            sender.enabled = false
            
        default:
            
            let isCurrentResultZero = currentResult == 0.0
            numberLabel.text = isCurrentResultZero ? text : numberLabel.text! + text
            currentResult = Double(numberLabel.text!)!
        }
        
        
        
    }
    
    
    @IBAction func operatorPressed(sender: UIButton) {
        
        doMathWith(currentResult, operation: sender.titleLabel!.text!)
    }
    
    
    @IBAction func clearButton(sender: AnyObject) {
        
        currentResult = 0
        numberLabel.text = "0"
        firstTimeThrough = true
        
    }
    
    
}

//MARK : Operator Methods
extension ViewController {
    
    func doMathWith(number: Double, operation: String) {
        
        if !firstTimeThrough {
            
            switch operation {
            case "÷" :
                accumulation /= number
            case  "×":
                accumulation *= number
            case "-":
                accumulation -= number
            case "+":
                accumulation += number
            case "=":
            
                numberLabel.text! = String(accumulation)
                
            default:
                fatalError("Operator press that isn't recognized.")
            }
            
            currentResult = 0.0
            numberLabel.text! = String(accumulation)
            
            
        }
        
        accumulation = currentResult
        currentResult = 0.0
        firstTimeThrough = false
        
        
        
    }
    
    
    
}




