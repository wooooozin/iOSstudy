//
//  SegueViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/10.
//

import UIKit

class SegueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
