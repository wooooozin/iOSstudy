//
//  RoundButton.swift
//  CalculatorDemo
//
//  Created by 효우 on 2023/02/15.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

  @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
