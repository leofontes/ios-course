//
//  ReviewCell.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 20/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    

    func configureCell(_ review: Review) {
        usernameLbl.text = "by: \(review.userName)"
        ratingLbl.text = "rating: \(review.rating)"
        descriptionLbl.text = review.description
    }
}
