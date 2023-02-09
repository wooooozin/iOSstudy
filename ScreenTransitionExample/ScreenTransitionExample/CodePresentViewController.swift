//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/10.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
        }
    }


    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Loopy")
        self.presentingViewController?.dismiss(animated: true)
        
    }
}
