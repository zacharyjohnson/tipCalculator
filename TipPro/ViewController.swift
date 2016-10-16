//
//  ViewController.swift
//  TipPro
//
//  Created by Zach Johnson on 10/15/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    @IBOutlet weak var textualFeedback: UILabel!
    @IBAction func calculateTip(_ sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
            textualFeedback.text = "Hmm, 15%? Waitstaff \nneed money too, \nyou cheapskate 😉"
        case 1:
            tipPercentage = 0.18
            textualFeedback.text = "I suppose 18% \nwould be sufficient. \nMaybe not though. 🙂"
        case 2:
            tipPercentage = 0.20
            textualFeedback.text = "You are what makes \nthe world go round!\n🎉🎉🎉🎉🎉"
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
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

