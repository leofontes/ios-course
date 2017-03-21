//
//  CastCell.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 20/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class CastCell: UICollectionViewCell {
    @IBOutlet weak var actorLbl: UILabel!
    @IBOutlet weak var characterLbl: UILabel!
    
    var cast: Cast!
    
    func configureCell(_ cast : Cast) {
        self.cast = cast
        
        actorLbl.text = self.cast.actor
        characterLbl.text = self.cast.character
    }
}
