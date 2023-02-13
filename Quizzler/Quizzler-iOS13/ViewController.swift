//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // connect the view controller components
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // qustion set
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    
    // when the view first uploaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // when the true, false button is pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True or False
        let actualAnswer = quiz[questionNumber].answer
        
        // change the button color if answer is right or wrong
        if userAnswer == actualAnswer{
            print("Right!")
            sender.backgroundColor = UIColor.green
        }else{
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        // change the question
        if questionNumber + 1 < quiz.count{
            questionNumber = questionNumber + 1
        }
        else{
            questionNumber = 0
        }
        
        // change the qustion text in the text area after 0.2seconds later
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // update the questionLabel
    @objc func updateUI(){
        // change the quiz text
        questionLabel.text = quiz[questionNumber].text
        
        // clear the color of Button
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // update the progress bar
        progressBar.progress = Float(questionNumber + 1)/Float(quiz.count)
    }
}

