//
//  MovieCell.swift
//  Movies
//
//  Created by Leonardo Thives da Luz Fontes on 2/19/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var thumb: UIImageView!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
