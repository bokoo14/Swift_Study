//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView! // view the progress percent
    @IBOutlet weak var titleLabel: UILabel!  // change the label
    
    // egg timer
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer() // when the button pressed -> create new timer
    
    // count the seconds
    var totalTime = 0
    var secondPassed = 0
    
    // play the audio that saved in my proj
    var player: AVAudioPlayer!
    
    // when pressed the button, egg timer starts
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //Stops the timer from ever firing again and requests its removal from its run loop.
        timer.invalidate()
        
        let hardness = sender.currentTitle! //save the button title -> Soft, Medium, Hard
        totalTime = eggTimes[hardness]! // 3, 4, 7
        
        //reset the existing progress and time & rename the titleLabel
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = "\(hardness) egg"
        
        // timer
        print("this counter counts seconds: \(secondPassed)")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // counts the time func
    @objc func updateCounter() {
        //count the passed time until totalTime
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed)/Float(totalTime)
        }else{ // when the time becomes 0
            timer.invalidate() // stops the timer
            titleLabel.text = "DONE!"
            
            // play the audio that saved in my proj file
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }

}
