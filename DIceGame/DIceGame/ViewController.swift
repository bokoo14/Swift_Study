//
//  ViewController.swift
//  DIceGame
//
//  Created by Bokyung on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var imageNumber: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstImageView.image = imageNumber[0]
        secondImageView.image = imageNumber[0]
    }

    // Button을 눌렀을때
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 첫번째 이미지 뷰의 이미지를 랜덤으로 변경
        firstImageView.image = imageNumber.randomElement()
        // 두번째 이미지 뷰의 이미지를 랜덤으로 변경
        secondImageView.image = imageNumber.randomElement()
    }
    

}

