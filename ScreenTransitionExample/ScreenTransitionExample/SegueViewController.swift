//
//  SegueViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/10.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var segueNameLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            segueNameLabel.text = name
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
