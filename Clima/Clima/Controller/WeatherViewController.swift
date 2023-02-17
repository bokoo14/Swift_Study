//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }
    
    // when the user press the search button
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // unable keyboard
        print(searchTextField.text!)
    }
    
    // when the user press the "go" button -> return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // unable keyboard
        print(searchTextField.text!)
        return true
    }
    
    // when user click other area
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else{
            searchTextField.placeholder = "Type something"
            return false
        }
    }
    
    // when user press the search button or go button
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}

