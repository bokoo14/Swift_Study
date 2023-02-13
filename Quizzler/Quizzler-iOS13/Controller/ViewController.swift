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
    
    var quizBrain = QuizBrain()
   
    // when the view first uploaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // when the true, false button is pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // check the answer is right or wrong
        if userGotItRight == true {
            print("Right!")
            sender.backgroundColor = UIColor.green
        }else{
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        // change the question to the next
        quizBrain.nextQuestion()
        
        // change the qustion text in the text area after 0.2seconds later
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // update the questionLabel
    @objc func updateUI(){
        // change the quiz text
        questionLabel.text = quizBrain.getQuestionText()
        
        // clear the color of Button
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // update the progress bar
        progressBar.progress = quizBrain.getProgress()
    }
}

