//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        var hardness = sender.currentTitle! //Soft, Medium, Hard
        
         let result = eggTimes[hardness]!
        print(result)
    }
    
    var counter = 60

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            counter -= 1
        }
    }


}
