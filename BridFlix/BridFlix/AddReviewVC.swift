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
        let parameters: Dictionary<String, Any> = getParameters()
        
        if message.isEmpty {
            Alamofire.request(requestURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            messageLbl.text = message
            messageLbl.alpha = CGFloat(floatLiteral: 1.0)
        }
        
    }
    
    func getParameters() -> Dictionary<String, Any> {
        if let text = usernameTextField.text, text.isEmpty {
            message = "Please fill in your username for the review"
            
        } else if reviewTextField.text == "" {
            message = "Please fill in your rating for the review"
            
        } else {
           message = ""
        }
        
        let star: Dictionary<String, Any> = [NetworkUtil.BODY_VALUE : ratingTextField.text as Any]
        return [
            NetworkUtil.BODY_USERNAME : usernameTextField.text as Any,
            NetworkUtil.BODY_DESCRIPTION : reviewTextField.text as Any,
            NetworkUtil.BODY_STAR : star as Any
        ]
        
        
    }
}
