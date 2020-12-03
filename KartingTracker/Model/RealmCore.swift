//
//  RealmCore.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 01/12/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import RealmSwift

class RealmCore {
    
    lazy var realm:Realm = {
        return try! Realm()
    }()
    
    func commitWrite(date: Date, raceName: String, laps: String, position: String) {
        realm.beginWrite()
        let newObject = Race()
        newObject.date = date
        newObject.raceName = raceName
        newObject.laps = laps
        newObject.position = position
        realm.add(newObject)
        try! realm.commitWrite()
    }
    
    func commitDelete(object: Race) {
        realm.beginWrite()
        realm.delete(object)
        try! realm.commitWrite()
        
    }
    
    func races() -> [Race] {
        return realm.objects(Race.self).map({ $0 })
    }
    
}
