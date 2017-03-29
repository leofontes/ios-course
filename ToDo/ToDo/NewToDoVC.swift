//
//  NewToDoVC.swift
//  ToDo
//
//  Created by Leonardo Fontes on 29/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class NewToDoVC: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    
    var toDoArray: [ToDo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        let toDo: ToDo = ToDo()
        toDo.title = titleTF.text!
        toDo.desc = descriptionTF.text!
        toDo.save()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}
