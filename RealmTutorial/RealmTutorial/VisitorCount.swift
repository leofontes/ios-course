//
//  VisitorCount.swift
//  RealmTutorial
//
//  Created by Leonardo Fontes on 28/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorCount: Object {
    dynamic var date: Date = Date()
    dynamic var count: Int = Int(0)
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
