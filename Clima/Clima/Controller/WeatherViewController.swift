//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager() // get the current location
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // view the permission to get user's location
        locationManager.requestLocation() // requests the one-time delivery of the user's current location
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
}


//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
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
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        // reset the seatchTextField
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
