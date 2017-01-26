//
//  ViewController.swift
//  scrollDemo
//
//  Created by Leo Fontes on 26/01/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth:CGFloat = 0.0
        let scrollSize = scrollView.frame.size
        
        for i in 0...2 {
            let image = UIImage(named: "icon\(i).png")
            let imageView = UIImageView(image : image)
            images.append(imageView)
            
            var newX:CGFloat = 0.0
            newX = scrollSize.width / 2 + scrollSize.width * CGFloat(i)
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
}

