//
//  Race.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 30/11/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import RealmSwift


class Race: Object {
    @objc dynamic var raceName: String = " "
    @objc dynamic var date: Date = Date()
    @objc dynamic var laps: Int = 1
    
    
}
