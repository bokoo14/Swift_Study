//
//  WeatherManager.swift
//  Clima
//
//  Created by Bokyung on 2023/02/17.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d5e4a2f4a0ac03a3f4db61c7788af767&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // step1. Create a url
        if let url = URL(string: urlString){
            // step2. Create a urlSession
            let session = URLSession(configuration: .default)
            
            // step3. give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                // if error is exists, return
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // step4. start the task
            task.resume()
        }
    }
    
    // decode the JSON data to wanted data type
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].id)
        } catch {
            print(error)
        }
    }
    
}
