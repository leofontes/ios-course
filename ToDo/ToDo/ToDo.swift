//
//  ToDo.swift
//  ToDo
//
//  Created by Leonardo Fontes on 29/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import Foundation
import RealmSwift

class ToDo: Object {
    dynamic var title: String = ""
    dynamic var desc: String = ""
    
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
