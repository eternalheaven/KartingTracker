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
}

extension RaceTableViewCell {
    func configure(date: String, raceName: String) {
        self.raceName.text = raceName
        self.date.text = date
    }
}
