//
//  ViewController.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 30/11/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import UIKit
import RealmSwift

class AddRaceViewController: UIViewController {
    
    weak var delegate: RefreshDelegate?
    let realmCore = RealmCore()
        
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var raceName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        if let raceName = self.raceName.text, !raceName.isEmpty {
            let date = self.datePicker.date
            realmCore.commitWrite(date: date, raceName: raceName)
            delegate?.refresh()
            navigationController?.dismiss(animated: true, completion: nil)
        } else {
            showAlert()
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Добавьте название гонки", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Окей", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func configureDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
//        datePicker.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
}
