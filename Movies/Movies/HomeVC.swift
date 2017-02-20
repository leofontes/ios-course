//
//  HomeVC.swift
//  Movies
//
//  Created by Leonardo Thives da Luz Fontes on 2/17/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    var moviesList: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genSampleData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func downloadPopularMovies() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCell {
            let movie = moviesList[indexPath.row]
            cell.configureCell(movie: movie)
            return cell
        } else {
            return MovieCell()
        }
    }

    func genSampleData() {
        let m1: Movie = Movie(id: "1", originalTitle: "Titanic", posterPath: "https://upload.wikimedia.org/wikipedia/en/2/22/Titanic_poster.jpg", overview: "", voteAverage: 4.0, releaseDate: "")
        moviesList.append(m1)
    }
}

