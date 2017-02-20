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
    
    func configureCell(movie: Movie) {
        self.name.text = movie.originalTitle
        
        let url = URL(string: movie.posterPath)!
        //AsyncTask
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.thumb.image = UIImage(data: data)
                }
            } catch {
                print("Error on download")
            }
        }
    }

}
