//
//  ViewController.swift
//  TestApp
//
//  Created by Bokyung on 2023/08/09.
//

import UIKit

class ViewController: UIViewController {
    // MARK: label
    // IB: Interface Builder
    // Outlet: 배출구
    // @IBOutlet: 코드상의 어떤 설정을 (스토리보드로) 전달하기 위한 키워드(주석)
    // 지울때는 연결선을 먼저 끊어준 후, 지워줘야 한다!
    @IBOutlet weak var mainLabel: UILabel!
    
    // MARK: button
    // 버튼의 속성값을 변경하고 싶다면, 버튼을 가리키는 변수를 만들어줘야 한다
    @IBOutlet weak var myButton: UIButton!
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // IB: Interface Builder
    // Action: 행동
    // IBAction: (스토리보드 상에) 이벤트(동작)가 일어나는 경우, 어떤 함수를 호출하여 실행시킬 것인지 알려주는 키워드(주석)
    @IBAction func buttonPressed(_ sender: UIButton) {
        // MARK: label
        mainLabel.text = "안녕하세요"
        // #colorLiteral()을 통해서 colorLiteral을 사용할 수 있음
        // #imageLiteral()도 있음
        mainLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        mainLabel.textAlignment = NSTextAlignment.right
        
        // MARK: button
        myButton.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        myButton.setTitleColor(.black, for: UIControl.State.focused) // 버튼의 글자색
    }
}

