//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/10.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func tapBackButton(_ sender: UIButton) {

        self.presentingViewController?.dismiss(animated: true)

    }
}
