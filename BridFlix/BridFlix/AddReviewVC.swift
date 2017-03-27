//
//  AddReviewVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 21/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class AddReviewVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    
    var movie: Movie!
    var message: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func submitPressed(_ sender: Any) {
        let requestURL: URL = NetworkUtil.buildReviewRequest(movieId: movie.id)
        let parameters: Dictionary<String, Any> = getParameters(userTF: usernameTextField, ratingTF: ratingTextField, reviewTF: reviewTextField)
        
        if message.isEmpty {
            Alamofire.request(requestURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            messageLbl.text = message
            messageLbl.alpha = CGFloat(floatLiteral: 1.0)
        }
        
    }
    
    func getParameters(userTF: UITextField, ratingTF: UITextField, reviewTF: UITextField) -> Dictionary<String, Any> {
        if let text = userTF.text, text.isEmpty {
            message = "Please fill in your username for the review"
            
        } else if let rating = ratingTF.text, rating.isEmpty {
            message = "Please fill in your rating for the review"
            
        } else {
           message = ""
        }
        
        let star: Dictionary<String, Any> = [NetworkUtil.BODY_VALUE : ratingTF.text as Any]
        return [
            NetworkUtil.BODY_USERNAME : userTF.text as Any,
            NetworkUtil.BODY_DESCRIPTION : reviewTF.text as Any,
            NetworkUtil.BODY_STAR : star as Any
        ]
        
        
    }
}
