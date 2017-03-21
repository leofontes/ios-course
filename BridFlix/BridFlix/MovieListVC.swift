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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var moviesArr: [Movie] = [Movie]()
    private var filteredMoviesArr: [Movie] = [Movie]()
    private var inSearchMode:Bool = false
    
    private let CASE_NORMAL : Int = 1
    private let CASE_FILTERED : Int = 2
    private let SORT_ASC : Int = 1
    private let SORT_DSC : Int = 2
    
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
        
        performSegue(withIdentifier: "movieSelected", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSelected" {
            if let destination = segue.destination as? DetailVC {
                if let movie = sender as? Movie {
                    destination.movie = movie
                }
            }
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
    
    func sortArray(array: Int, sortOption: Int) {
        if array == self.CASE_NORMAL {
            if sortOption == self.SORT_ASC {
                moviesArr.sort(by: { (first: Movie, second: Movie) -> Bool in
                    first.title < second.title
                })
            } else if sortOption == self.SORT_DSC {
                moviesArr.sort(by: { (first: Movie, second: Movie) -> Bool in
                    first.title > second.title
                })
            }
        } else if array == self.CASE_FILTERED {
            if sortOption == self.SORT_ASC {
                filteredMoviesArr.sort(by: { (first: Movie, second: Movie) -> Bool in
                    first.title < second.title
                })
            } else if sortOption == self.SORT_DSC {
                filteredMoviesArr.sort(by: { (first: Movie, second: Movie) -> Bool in
                    first.title > second.title
                })
            }
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if inSearchMode {
                sortArray(array: self.CASE_FILTERED, sortOption: self.SORT_ASC)
            } else {
                sortArray(array: self.CASE_NORMAL, sortOption: self.SORT_ASC)
            }
            break
        case 1:
            if inSearchMode {
                sortArray(array: self.CASE_FILTERED, sortOption: self.SORT_DSC)
            } else {
                sortArray(array: self.CASE_NORMAL, sortOption: self.SORT_DSC)
            }
            break
        default:
            //dosomething
            break
        }
    }
    
}
