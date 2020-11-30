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
    
    weak var delegate: RefreshProtocol?
    private let realm = try! Realm()
    
    var completionHandler: (() -> Void)?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var raceName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        if let text = self.raceName.text, !text.isEmpty {
            let date = self.datePicker.date
            realm.beginWrite()
            
            let newItem = Race()
            newItem.date = date
            newItem.raceName = text
            
            realm.add(newItem)
            try! realm.commitWrite()
            
            delegate?.refresh()
            
            navigationController?.dismiss(animated: true, completion: nil)
            
            
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Добавьте название гонки", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Окей", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
       navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
