//
//  ViewController.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 30/11/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, RefreshProtocol {
    
    @IBOutlet weak var raceTableView: UITableView!
    
    private let realm = try! Realm()
    private var data = [Race]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(Race.self).map({ $0 })
        
        raceTableView.dataSource = self
        raceTableView.delegate = self
        raceTableView.register(UINib(nibName: "RaceTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let strDate = formatter.string(from: date)
        return strDate
    }
    
    func refresh() {
        print("smth")
        data = realm.objects(Race.self).map({ $0 })
        raceTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddRaceViewController else { return }
        destination.delegate = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = raceTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RaceTableViewCell {
            cell.raceName.text = data[indexPath.row].raceName
            let strDate = dateFormatter(date: data[indexPath.row].date)
            cell.date.text = strDate
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = data[indexPath.row]
            data.remove(at: indexPath.row)            
            realm.beginWrite()
            realm.delete(object)
            try! realm.commitWrite()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
