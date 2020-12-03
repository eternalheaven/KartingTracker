//
//  RaceTableViewCell.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 30/11/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

class RaceTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var raceName: UILabel!
    @IBOutlet weak var laps: UILabel!
    @IBOutlet weak var position: UILabel!
}

extension RaceTableViewCell {
    func configure(date: String, raceName: String, laps: String, position: String) {
        self.raceName.text = raceName
        self.date.text = date
        self.laps.text = laps
        self.position.text = position
    }
}
