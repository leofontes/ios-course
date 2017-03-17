//
//  MovieCell.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 16/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    func configCell(movie: Movie) {
        movieTitle.text = movie.title
        movieDescription.text = movie.description
    }
}
