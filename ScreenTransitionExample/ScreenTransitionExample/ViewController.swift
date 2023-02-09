//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CondePushViewController") else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

