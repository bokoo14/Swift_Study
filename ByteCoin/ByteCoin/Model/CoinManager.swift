//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "553ACAE8-62E4-4164-994E-0AC4C4EA02B6"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    // for: external name, currency: internal name
    func getCoinPrice(for currency: String){
        // pass the selected currency to the CoinManager
        
        // Use String concatenation to add the selected currency at the end of the baseURL along with the API key
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        // use optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString){
            // create a new URLSession object with default configuration
            let session = URLSession(configuration: .default)
            
        }
    }

}
