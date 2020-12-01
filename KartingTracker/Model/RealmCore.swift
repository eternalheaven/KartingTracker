//
//  RealmCore.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 01/12/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import RealmSwift

class RealmCore {
    
    let realm = try! Realm()
    
    func commitWrite(date: Date, raceName: String) {
        realm.beginWrite()
        let newObject = Race()
        newObject.date = date
        newObject.raceName = raceName
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
