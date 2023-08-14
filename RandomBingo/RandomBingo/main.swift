//
//  main.swift
//  RandomBingo
//
//  Created by Bokyung on 2023/08/14.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while true {
    var userInput = readLine() // 기본 - 문자열로 받아옴
    
    if let input = userInput { // input을 받아오는 것 optional
        if let number = Int(input) { // 형변환 또한 optional
            myChoice = number
        }
    }
    
    //print(myChoice)
    
    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo!")
        break
    }
    
} // while true


