//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


// by convention, Swift protocol are usually written in the file that has the class/struct which will call the delegate methods, i.e. the CoinManager
protocol CoinManagerDelegate {
    
    // create the method stubs without implementation in the protocol
    // it's usually a good idea to also pass along a reference to the current class
    // e.g. func didUpdatePrice(_ coinManager: CoinManager, price: String, currency: String)
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}


struct CoinManager {
    // create an optional delegate that will have to implement the delegate the methods
    // which we can notify when we have updated the price
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "input API"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    // for: external name, currency: internal name
    // pass the selected currency to the CoinManager
    func getCoinPrice(for currency: String){
        // Use String concatenation to add the selected currency at the end of the baseURL along with the API key
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        // use optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString){
            // create a new URLSession object with default configuration
            let session = URLSession(configuration: .default)
            
            // Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData){
                        // optional: round the price down to 2 decimal places
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        // Call the delegate method in the delegate(ViewController) and pass along the necessary data
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            // Start task to fetch data from bitcoin average's servers
            task.resume()
        }
    }
    
    
    func parseJSON(_ data: Data) -> Double? {
        // create a JSONDecoder
        let decoder = JSONDecoder()
        do {
            // try to decode the data using the CoinData structure
            let decodedData = try decoder.decode(CoinData.self, from: data)
            
            // Get the last property from the decoded data
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
        }catch {
            // catch and print any errors
            print(error)
            return nil
        }
    }
    
}
