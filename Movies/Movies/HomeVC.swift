//
//  HomeVC.swift
//  Movies
//
//  Created by Leonardo Thives da Luz Fontes on 2/17/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    var moviesList: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadPopularMovies {
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func downloadPopularMovies(completed: @escaping DownloadComplete)  {
        let popularURL = URL(string: getPopularUrl())!
        Alamofire.request(popularURL).responseJSON { response in
            if let dict = response.value as? Dictionary<String, Any> {
                if let results = dict["results"] as? [Dictionary<String, Any>] {
                    for obj in results {
                        let movie = Movie(dict: obj)
                        self.moviesList.append(movie)
                        self.tableView.reloadData()
                    }
                }
            }
            completed()
        }
    }
    
    func downloadUpcomingMovies(completed: @escaping DownloadComplete) {
        let upcomingURL = URL(string: getUpcomingUrl())!
        Alamofire.request(upcomingURL).responseJSON { response in
            if let dict = response.value as? Dictionary<String, Any> {
                if let results = dict["results"] as? [Dictionary<String, Any>] {
                    for obj in results {
                        let movie = Movie(dict: obj)
                        self.moviesList.append(movie)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func fetchFavoriteMovies() {
        
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

    func fetchCatalog() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            downloadPopularMovies {
                self.tableView.reloadData()
            }
            break
        case 1:
            downloadUpcomingMovies {
                self.tableView.reloadData()
            }
            break
        case 2:
            fetchFavoriteMovies()
            tableView.reloadData()
            break
        default:
            downloadPopularMovies {
                
            }
        }
    }
    
    
    @IBAction func segmentChanged(_ sender: Any) {
        moviesList.removeAll(keepingCapacity: false)
        fetchCatalog()
    }
}

