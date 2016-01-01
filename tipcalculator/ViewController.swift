//
//  ViewController.swift
//  tipcalculator
//
//  Created by Michal Ruopp on 12/31/15.
//  Copyright © 2015 Michal Ruopp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.15, 0.20, 0.25]
    
    var numPersons = 1;
    var tip = 0.0;
    var total = 0.0;
    
    var myLocale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
    
    var numFormatter = NSNumberFormatter()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator"
        billField.becomeFirstResponder()
        
        numFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        numFormatter.locale = myLocale
        
        tipLabel.text = numFormatter.stringFromNumber(tip)
        totalLabel.text = numFormatter.stringFromNumber(total)
        splitLabel.text = numFormatter.stringFromNumber(total / Double(numPersons))
       
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEditingChanged(sender: AnyObject) {
        
        let selectedTipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        tip = billAmount * selectedTipPercentage
        total = billAmount + tip
        
        tipLabel.text = numFormatter.stringFromNumber(tip)
        totalLabel.text = numFormatter.stringFromNumber(total)
        splitLabel.text = numFormatter.stringFromNumber(total / Double(numPersons))
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func onStepperValueChanged(sender: UIStepper) {
        
        let stepperValue = Int(sender.value)
        
        numPersons = stepperValue + 1
        
        personsLabel.text = "Split (\(numPersons))"
        splitLabel.text = numFormatter.stringFromNumber(total / Double(numPersons))
    }
}

