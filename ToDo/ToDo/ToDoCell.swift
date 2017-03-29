//
//  ToDoCell.swift
//  ToDo
//
//  Created by Leonardo Fontes on 28/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var toDo: ToDo?
    
    func buildCell(todo: ToDo) {
        titleLbl.text = todo.title
        descriptionLbl.text = todo.desc
        toDo = todo
    }
    
    @IBAction func donePressed(_ sender: Any) {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.delete(toDo!)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}
