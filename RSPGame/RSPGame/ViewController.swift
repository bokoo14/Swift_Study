//
//  ViewController.swift
//  RSPGame
//
//  Created by Bokyung on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // rawValue에 100을 넣게 되면, nil이 나오니까 optional type으로 되어 있음
    var comChoice: RPS = RPS(rawValue: Int.random(in: 0...2))!
    var myChoice: RPS = RPS.rock // 나의 선택
    
    
    // 함수/ 매서드
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1) 첫번째/두번째 이미지뷰에 준비(목) 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }

    // 3가지의 버튼을 하나의 함수에 연결을 시켜놓았는데, 어떤 버튼을 눌렀는지 알 수 있어야 한다! -> 그래서 함수의 parameter를 활용
    // sender라는 parameter를 활용하면, 가위/바위/보를 구분할 수 있다!
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보(enum)를 선택해서 그 정보를 저장해야 됨
        guard let title = sender.currentTitle else {
            return
        }
        print("title is ..", title)
        
        switch title {
        case "가위":
            // 가위 열거형을 만들어서 저장
            myChoice = RPS.scissors
        case "바위":
            // 바위 열거형을 만들어서 저장
            myChoice = RPS.rock
        case "보":
            // 보 열거형을 만들어서 저장
            myChoice = RPS.paper
        default:
            break
        } // switch
        
    }
    
    // "SELECT"버튼을 눌렀을때
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 0) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = RPS(rawValue: Int.random(in: 0...2))!
        
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "ready")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 3) 내가 선택한 것을 이미지 뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단/표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if (comChoice == .rock && myChoice == .paper) || (comChoice == .paper && myChoice == .scissors) || (comChoice == .scissors && myChoice == .rock){
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
        
    } // select button
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 내 선택 이미지뷰에 준비 이미지 표시
        // 4) 내 선택 레이블에도 준비 문자열 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인 레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = RPS(rawValue: Int.random(in: 0...2))!
    }
    
}

