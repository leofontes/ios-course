//
//  MovieListVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 16/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class MovieListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var moviesArr: [Movie] = [Movie]()
    private var filteredMoviesArr: [Movie] = [Movie]()
    private var inSearchMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        fetchMovies()
    }
    
    func fetchMovies() {
        let requestURL = NetworkUtil.buildMoviesRequest()
        
        Alamofire.request(requestURL).responseJSON { response in
            if let JSON = response.result.value as? [Dictionary<String, Any>] {
                for dict in JSON {
                    let m: Movie = Movie(id: (dict["id"] as? Int)!, title: (dict["name"] as? String)!, description: (dict["description"] as? String)!)
                    self.moviesArr.append(m)
                }
                self.tableView.reloadData()
            }
        }
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            self.tableView.reloadData()
        } else {
            inSearchMode = true
            
            filteredMoviesArr = moviesArr.filter({$0.title.range(of: searchBar.text!) != nil })
            self.tableView.reloadData()
        }
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var movie:Movie!
        
        if inSearchMode {
            movie = filteredMoviesArr[indexPath.row]
        } else {
            movie = moviesArr[indexPath.row]
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        if inSearchMode {
            cell.configCell(movie: filteredMoviesArr[indexPath.row])
        } else {
            cell.configCell(movie: moviesArr[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredMoviesArr.count
        } else {
            return moviesArr.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
