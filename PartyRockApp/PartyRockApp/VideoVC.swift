//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Leo Fontes on 07/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    private var _partyRock:PartyRock!
    
    public var partyRock:PartyRock {
        get {
            return _partyRock
        } set {
            self._partyRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
