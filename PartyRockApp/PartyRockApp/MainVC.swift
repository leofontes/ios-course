//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Leo Fontes on 07/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRockArr = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        addDataArr()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            //Find correct partyRock
            let partyRock = partyRockArr[indexPath.row]
            //Update the cell
            cell.updateUI(partyRock: partyRock)
            //Return cell
            return cell
        } else {
            //If failed, returns basic cell to prevent crash
            return UITableViewCell()

        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRockArr.count
    }
    
    func addDataArr() {
        let p1 = PartyRock(imageURL: "http://youredm.youredm1.netdna-cdn.com/wp-content/uploads/2016/01/oliver-heldens.jpg?x97231", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AiGGFDn7ac4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Oliver Heldens")
        let p2 = PartyRock(imageURL: "http://media.lessthan3.com/wp-content/uploads/2014/04/steve-angello-lessthan3-e1398526014144.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/watch?v=Z0Z-64pKxC0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Steve Angello")
        let p3 = PartyRock(imageURL: "http://www.suasletras.com/fotos_artista/816c298a3580676919c104d550c79d7c.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/watch?v=ZXF3LAVk1uE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Galantis")
        let p4 = PartyRock(imageURL: "http://d1at8s8ztmsmha.cloudfront.net/wp-content/uploads/2017/02/03153711/alesso-live-1024x683.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/watch?v=OvSoTT0NIio\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Alesso")
        let p5 = PartyRock(imageURL: "http://www.playedm.com.br/wp-content/uploads/2016/11/axwell-ingrosso.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/watch?v=eXLye6gQdT8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Axwell ^ Ingrosso")
        
        partyRockArr.append(p1)
        partyRockArr.append(p2)
        partyRockArr.append(p3)
        partyRockArr.append(p4)
        partyRockArr.append(p5)
    }
}

