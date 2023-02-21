//
//  WriteViewController.swift
//  DiaryDemo
//
//  Created by 효우 on 2023/02/20.
//

import UIKit

protocol WriteViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContetsTextView()
        self.configureDatePicker()
        self.confirmButton.isEnabled = false
        self.configureInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - IBAction Method

    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        self.delegate?.didSelectRegister(diary: diary)
        self.navigationController?.popViewController(animated: true)
    }
}

extension WriteViewController {
    private func configureContetsTextView() {
        let borderColor = UIColor(red: 220/225, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentTextView.layer.borderColor = borderColor.cgColor
        self.contentTextView.layer.borderWidth = 0.5
        self.contentTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    private func configureInputField() {
        self.contentTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChage), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChage), for: .editingChanged)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) &&
            !(self.dateTextField.text?.isEmpty ?? true) && !self.contentTextView.text.isEmpty
    }
    
    @objc private func titleTextFieldDidChage(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChage(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater = DateFormatter()
        formmater.dateFormat = "YYYY 년 MM 월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko-KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)
    }
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
