//
//  ViewController.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 30/11/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var raceTableView: UITableView!
    
    private var races = [Race]()
    private let dateFormatter = DateFormatterBuilder()
    private let realmCore = RealmCore()
    private let cellIdentifier = "cell"
    let model = Race()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        races = realmCore.races()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = (segue.destination as? UINavigationController)?.viewControllers.first as? AddRaceViewController else { return }
        destination.delegate = self
    }
    
    private func setupTableView() {
        raceTableView.dataSource = self
        raceTableView.delegate = self
        raceTableView.register(UINib(nibName: "RaceTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}
// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = races[indexPath.row]
            races.remove(at: indexPath.row)
            realmCore.commitDelete(object: object)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = raceTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RaceTableViewCell {
            let date = dateFormatter.formate(date: races[indexPath.row].date)
            cell.configure(date: date, raceName: races[indexPath.row].raceName)
            return cell
        }
        return UITableViewCell()
    }
}
    
//MARK: - RefreshDelegate
    
extension MainViewController: RefreshDelegate {
    func refresh() {
        races = realmCore.races()
        raceTableView.reloadData()
    }
}
