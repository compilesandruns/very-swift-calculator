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
    
    var previousNum = ""
    var runningTotal = ""
    var operation = ""
    
    var isADecimal = false
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
    
    
    func formatButtonBorder(button : UIButton) {
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
    
}


//MARK UI

extension ViewController {
    
    @IBAction func numberPressed(sender: UIButton) {
        
        if(firstTimeThrough) {
            
            if(numberLabel.text == "0") {
                
                numberLabel.text = (sender.titleLabel?.text)!
                
            }
            else {
                numberLabel.text! += (sender.titleLabel?.text)!
            }
            
            previousNum = numberLabel.text!
            
            print("previous number: \(previousNum)")
        }
        else {
            
            
        }
        
        
    }
    
    
    @IBAction func operatorPressed(sender: UIButton) {
        
        guard let operationPressed = sender.titleLabel?.text else { return }
        
        if(!firstTimeThrough)
        {
            switch operationPressed
            {
            case "+" :
                operation = "+"
            case "-" :
                operation = "+"
            case "÷" :
                operation = "+"
            case "×" :
                operation = "+"
            default :
                fatalError()

            }
            
                print("\(operation)")
        }
            
    }
    
    
    
    
}


