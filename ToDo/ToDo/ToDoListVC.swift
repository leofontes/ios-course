//
//  ToDoListVC.swift
//  ToDo
//
//  Created by Leonardo Fontes on 28/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var toDoArray: [ToDo] = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getToDosFromDatabase()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath) as! ToDoCell
        cell.buildCell(todo: toDoArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func getToDosFromDatabase() {
        do {
            let realm = try Realm()
            print("Path to realm file: " + realm.configuration.fileURL!.absoluteString)
            let results: Results<ToDo> =  realm.objects(ToDo.self)
            for result in results {
                toDoArray.append(result)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }

    
}

