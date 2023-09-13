//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Bokyung on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    
    
    // 재정의, 앱의 화면에 들어오면 처음 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
    }

    
    // 값이 변할때마다 함수를 호출
    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
}

