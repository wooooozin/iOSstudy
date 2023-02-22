//
//  ViewController.swift
//  TimerDemo
//
//  Created by 효우 on 2023/02/23.
//

import UIKit

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    
    var duaration = 60
    var timerStatus: TimerStatus = .end
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    // MARK: - @IBAction Methods
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.timerStatus = .end
            self.cancelButton.isEnabled = false
            self.setTimerInfoViewVisble(isHidden: true)
            self.datePicker.isHidden = false
            self.toggleButton.isSelected = false
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duaration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
        }
    }
    
}

// MARK: - Methods

extension ViewController {
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
}

