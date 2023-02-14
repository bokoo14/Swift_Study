//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // connect the all view components and controller
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    // when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // link both buttons to an IBAction called choiceMade()
    @IBAction func choiceMade(_ sender: UIButton) {
        // change the story whether the button is choice1 or choice2
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        
        updateUI()
    }
    
    
    // update the UI to target Stage
    func updateUI(){
        // change the UI's title, choice1, choice2
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

