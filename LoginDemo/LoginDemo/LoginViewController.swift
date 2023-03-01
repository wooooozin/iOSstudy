//
//  LoginViewController.swift
//  LoginDemo
//
//  Created by 효우 on 2023/03/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureButtonLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        
    }

}

extension LoginViewController {
    private func configureButtonLayer() {
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    
    
}
