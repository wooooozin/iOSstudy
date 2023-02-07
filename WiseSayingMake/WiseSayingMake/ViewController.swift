//
//  ViewController.swift
//  WiseSayingMake
//
//  Created by 효우 on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wiseSayingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let wiseSaying = [
        WiseSaying(contents: "삶이 있는 한 희망은 있다", name: "키케로"),
        WiseSaying(contents: "산다는것 그것은 치열한 전투이다.", name: "로망로랑"),
        WiseSaying(contents: "하루에 3시간을 걸으면 7년 후에 지구를 한바퀴 돌 수 있다", name: "사무엘잭슨"),
        WiseSaying(contents: "피할수 없으면 즐겨라", name: "로버트 엘리엇")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wiseSayingLabel.text = "버튼을 눌러 명언을 만들어 보세요"
        self.nameLabel.text = ""
    }

    @IBAction func tapWiseSayingButton(_ sender: UIButton) {
        let random = Int(arc4random_uniform(4))
        let wiseSaying = wiseSaying[random]
        self.wiseSayingLabel.text = wiseSaying.contents
        self.nameLabel.text = wiseSaying.name
    }
    
}

