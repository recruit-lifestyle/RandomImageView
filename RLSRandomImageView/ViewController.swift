//
//  ViewController.swift
//  RLSRandomImageView
//
//  Created by Nari on 2015/07/14.
//  Copyright (c) 2015年 nari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomImageView: RLSRandomImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        var images = [
            UIImage(named: "image1.jpg")!,
            UIImage(named: "image2.jpg")!,
            UIImage(named: "image3.jpg")!,
            UIImage(named: "image4.jpg")!,
            UIImage(named: "image5.jpg")!,
            UIImage(named: "image6.jpg")!,
            UIImage(named: "image7.jpg")!,
            UIImage(named: "image8.png")!,
            UIImage(named: "image9.jpg")!,
            UIImage(named: "image10.jpg")!,
            UIImage(named: "image11.jpg")!,
            UIImage(named: "image12.jpg")!,
            UIImage(named: "image13.jpg")!,
            UIImage(named: "image14.jpg")!,
            UIImage(named: "image15.jpg")!,
            UIImage(named: "image16.jpeg")!,
            UIImage(named: "image17.jpg")!,
            UIImage(named: "image18.jpg")!,
            UIImage(named: "image10.jpg")!,
            UIImage(named: "image11.jpg")!,
            UIImage(named: "image12.jpg")!,
            UIImage(named: "image13.jpg")!,
            UIImage(named: "image14.jpg")!,
            UIImage(named: "image15.jpg")!,
            UIImage(named: "image16.jpeg")!,
            UIImage(named: "image17.jpg")!,
            UIImage(named: "image18.jpg")!,
            UIImage(named: "image18.jpg")!
        ]
        randomImageView = RLSRandomImageView(frame: self.view.frame, images: images)
        self.view.addSubview(randomImageView)
        randomImageView.show(4, heightCount: 7)
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

