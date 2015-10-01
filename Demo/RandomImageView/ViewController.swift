//
//  ViewController.swift
//  RandomImageView
//
//  Copyright 2015 RECRUIT LIFESTYLE CO., LTD.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        var images = [
            UIImage(named: "image1.png")!,
            UIImage(named: "image2.png")!,
            UIImage(named: "image3.png")!,
            UIImage(named: "image4.png")!,
            UIImage(named: "image5.png")!,
            UIImage(named: "image6.png")!,
            UIImage(named: "image7.png")!,
            UIImage(named: "image8.png")!,
            UIImage(named: "image9.png")!,
            UIImage(named: "image10.png")!,
            UIImage(named: "image11.png")!,
            UIImage(named: "image12.png")!,
            UIImage(named: "image13.png")!,
            UIImage(named: "image14.png")!,
            UIImage(named: "image15.png")!,
            UIImage(named: "image16.png")!,
            UIImage(named: "image17.png")!,
            UIImage(named: "image18.png")!,
            UIImage(named: "image10.png")!,
            UIImage(named: "image11.png")!,
            UIImage(named: "image12.png")!,
            UIImage(named: "image13.png")!,
            UIImage(named: "image14.png")!,
            UIImage(named: "image15.png")!,
            UIImage(named: "image16.png")!,
            UIImage(named: "image17.png")!,
            UIImage(named: "image18.png")!,
            UIImage(named: "image18.png")!
        ]
        var randomImageView = RandomImageView(frame: self.view.frame, images: images)
        self.view.addSubview(randomImageView)
        randomImageView.show(4, heightCount: 7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

