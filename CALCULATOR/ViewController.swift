//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Alex Sobolevski on 6/29/16.
//  Copyright © 2016 Alex Sobolevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var userIsTypingNumber = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let textInDisplay = displayLabel.text!
        if let touchedNumber = sender.currentTitle {
            if userIsTypingNumber {
                if touchedNumber == "." && textInDisplay.rangeOfString(".") != nil {
                    return
                }
                displayLabel.text = textInDisplay + touchedNumber
            } else {
                if touchedNumber == "." && textInDisplay.rangeOfString(".") == nil {
                    displayLabel.text = textInDisplay + touchedNumber
                    userIsTypingNumber = true
                    return
                }
                if touchedNumber == "." && textInDisplay.rangeOfString(".") != nil {
                    return
                }
                displayLabel.text = touchedNumber
                userIsTypingNumber = true
     
            }
        }
    }
    
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(sender: UIButton) {
        if userIsTypingNumber {
            brain.setOpetand(displayValue)
            userIsTypingNumber = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}