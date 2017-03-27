//
//  LoginVC.swift
//  BridFlix
//
//  Created by Leonardo Fontes on 15/03/17.
//  Copyright © 2017 Leonardo Fontes. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    var usernameTF: UITextField?
    var passwordTF: UITextField?
    var submitBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func submitPressed() {
        let registerURL: URL = URL(string: "\(NetworkUtil.API_BASE_URL)\(NetworkUtil.API_REGISTER)")!
        let parameters: Dictionary<String, Any> = getParameters(usernameTF: usernameTF!, passwordTF: passwordTF!)
        if parameters[NetworkUtil.BODY_USERNAME] as! String == "" || parameters[NetworkUtil.BODY_PASSWORD] as! String == "" {
            self.alert(message: "Please fill in both your username and your password", title: "Login Error")
        } else {
            Alamofire.request(registerURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                if let JSON = response.result.value as? Dictionary<String, String> {
                    //Store the token for later use
                    NetworkUtil.setToken(token: JSON["token"]!)
                    
                    //Change screen
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "movielistvc") as! MovieListVC
                    self.show(vc, sender: JSON["userName"]!)
                } else {
                    //Let the user know if there's an error
                    self.alert(message: "Please check your connection, your username and your password", title: "Login Error")
                }
            }
        }
    }
    
    func getParameters(usernameTF: UITextField, passwordTF: UITextField) -> Dictionary<String, Any> {
        return [
            NetworkUtil.BODY_USERNAME : usernameTF.text as Any,
            NetworkUtil.BODY_PASSWORD : passwordTF.text as Any
        ]
        
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.orange
        
        usernameTF = usernameTextField
        passwordTF = passwordTextField
        submitBtn = submitButton
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(usernameTF!)
        self.view.addSubview(passwordTF!)
        self.view.addSubview(submitBtn!)
        
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        usernameTextFieldConstraints()
        passwordTextFieldConstraints()
        logoImageViewConstraints()
        submitButtonConstraints()
        
        super.updateViewConstraints()
    }
    
    func logoImageViewConstraints() {
        NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: logoImageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: -100).isActive = true
    }
    
    func usernameTextFieldConstraints() {
        NSLayoutConstraint(item: usernameTextField, attribute: .top, relatedBy: .equal, toItem: logoImageView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: usernameTextField, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: usernameTextField, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: usernameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    func passwordTextFieldConstraints() {
        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: usernameTextField, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    func submitButtonConstraints() {
        NSLayoutConstraint(item: submitButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: submitButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: submitButton, attribute: .top, relatedBy: .equal, toItem: passwordTextField, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: submitButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    }
    
    func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    lazy var logoImageView: UIImageView! = {
        let view = UIImageView()
        view.image = UIImage(named: "popcorn")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var usernameTextField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.placeholder = "Enter your username.."
        
        return view
    }()
    
    lazy var passwordTextField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.placeholder = "Enter your password.."
        view.isSecureTextEntry = true
        
        return view
    }()
    
    lazy var submitButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(LoginVC.submitPressed), for: .touchDown)
        view.setTitle("REGISTER / JOIN", for: .normal)
        view.backgroundColor = UIColor.black
        view.setTitleColor(UIColor.orange, for: .normal)
        
        return view
    }()
}

