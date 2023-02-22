//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
   
    
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    // need to change this to a var to be able to modify its properties
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // easily missed: must set the coinManager's delegate as this current class so that we can receive the notification when the delegate methods are called
        coinManager.delegate = self
        
        
        // set the datasource for the picker
        currencyPicker.dataSource = self
        // to update the PickerView with some titles and detect when it is interacted with
        currencyPicker.delegate = self
    }
    
    
    //MARK: - UIPickerViewDataSource
    // provide the data and add the implementation for the first method to determine how many colums we want in our picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // how many rows this picker should have -> use the count method on the currencyArray in the CoinManager to get that information
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
    //MARK: - UIPickerViewDelegate
    // return the title for a given row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // get called every time when the user scrolls the picker record the row number that was selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // pass the selected currency to the CoinManager via the getCoinPrice
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
    
    //MARK: - CoinManagerDelegate
    // provide the implement for the delegate methods
    // when the coinManager gets the price it will call this method and pass over the price and currency
    func didUpdatePrice(price: String, currency: String) {
        // Rememeder that we need to get hold of the main thread to update the UI, otherwise our app will crash if we try to do this from a background thread (URLSession works in the background)
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

