//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView! // view the progress percent
    @IBOutlet weak var titleLabel: UILabel!  // change the label
    
    //egg timer
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer() // when the button pressed more than twice-> reset the timer and create new timer
    
    var totalTime = 0
    var secondPassed = 0
    
    // when pressed the wanted button, egg timer start!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //Stops the timer from ever firing again and requests its removal from its run loop.
        timer.invalidate()
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = "\(hardness) egg"
        
        print("this counter counts seconds: \(secondPassed)")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // counts the time
    @objc func updateCounter() {
        //count the passed time until totalTime
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed)/Float(totalTime)
        }else{ // when the time becomes 0
            timer.invalidate() // stops the timer
            titleLabel.text = "DONE!"
        }
    }

}
