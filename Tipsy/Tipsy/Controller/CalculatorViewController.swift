//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTo2DecimalPlaces = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBAction func tipChanged(_ sender: UIButton) {
        // dismiss the keyboard when the user chooses one of the tip values
        billTextField.endEditing(true)
        
        // deselect all tip buttons & make the button that triggered the IBAction selected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        // get the current title of the button that was pressed
        let buttonTitle = sender.currentTitle!
        
        // remove the last character from the title(%) then turn it back into a String &  turn the string into a Double
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAnswer = Double(buttonTitleMinusPercentSign)!
        
        //divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAnswer / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // get the stepper value and update the UILabel text
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        // if the text is not an empty String ""
        if bill != "" {
            // turn the bill from a string to an actual string with decimal places e.g "123.50" -> 123.50
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            resultTo2DecimalPlaces = String(format: "%.2f", result)
            print(result)
            
            // when press the calculate button, change the view
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func viewDidLoad() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            // get hold of the instances of the destination VC and type cast it to a ResultsViewController
            let destinationVC = segue.destination as! ResultsViewController
            
            // connect the view controller and give the values
            destinationVC.result = resultTo2DecimalPlaces
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
}
