//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 효우 on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vcNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SegueViewController {
            vc.name = "LOOOOOPY"
        }
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CondePushViewController") as? CondePushViewController else { return }
        vc.name = "LOPPY"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.name = "LOPPY"
        vc.delegate = self
        self.present(vc, animated: true)
        
    }
    
}

extension ViewController: SendDataDelegate {
    func sendData(name: String) {
        vcNameLabel.text = name
    }
}

