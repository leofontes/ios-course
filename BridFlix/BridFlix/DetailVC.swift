//
//  DetailVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 17/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var navbar: UINavigationItem!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var movie: Movie!
    var reviewsArr = [Review]()
    var castArr = [Cast]()
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        navbar.title = movie.title
        descriptionLbl.text = movie.description
        
        fetchDetailedInfo(movieParam: movie)
    }
    
    //CollectionView Stuff
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "castCell", for: indexPath) as! CastCell
        cell.configureCell(castArr[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castArr.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 90)
    }
    
    //TableView stuff
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewCell
        cell.configureCell(reviewsArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "addReviewSegue", sender: movie)
    }
    
    @IBAction func photoPressed(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            posterImgView.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addReviewSegue" {
            if let destination = segue.destination as? AddReviewVC {
                if let movie = sender as? Movie {
                    destination.movie = movie
                }
            }
        }
    }
    
    func fetchDetailedInfo(movieParam: Movie) {
        let requestURL: URL = NetworkUtil.buildMovieWithIdRequest(movieId: movieParam.id)
        
        Alamofire.request(requestURL).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, Any> {
                
                if let reviews = JSON["reviews"] as? [Dictionary<String, Any>] {
                    for review in reviews {
                        let reviewToAdd: Review = Review()
                        reviewToAdd.userName = review["userName"] as! String
                        reviewToAdd.description = review["description"] as! String
                        
                        if let star = review["star"] as? Dictionary<String, Any> {
                            reviewToAdd.rating = star["value"] as! Int
                        }
                        
                        self.reviewsArr.append(reviewToAdd)
                    }
                    
                    self.tableView.reloadData()
                }
                
                if let cast = JSON["cast"] as? Dictionary<String, Any> {
                    if let roles = cast["roles"] as? [Dictionary<String, Any>] {
                        for role in roles {
                            let castToAdd: Cast = Cast()
                            if let actor = role["actor"] as? Dictionary<String, Any> {
                                castToAdd.actor = actor["name"] as! String
                            }
                            if let character = role["character"] as? Dictionary<String, Any> {
                                castToAdd.character = character["name"] as! String
                            }
                            self.castArr.append(castToAdd)
                        }
                    }
                    
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
