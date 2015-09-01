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
        var images: NSMutableArray = NSMutableArray()
        images.addObject(UIImage(named: "image1.jpg")!)
        images.addObject(UIImage(named: "image2.jpg")!)
        images.addObject(UIImage(named: "image3.jpg")!)
        images.addObject(UIImage(named: "image4.jpg")!)
        images.addObject(UIImage(named: "image5.jpg")!)
        images.addObject(UIImage(named: "image6.jpg")!)
        images.addObject(UIImage(named: "image7.jpg")!)
        images.addObject(UIImage(named: "image8.png")!)
        images.addObject(UIImage(named: "image9.jpg")!)
        images.addObject(UIImage(named: "image10.jpg")!)
        images.addObject(UIImage(named: "image11.jpg")!)
        images.addObject(UIImage(named: "image12.jpg")!)
        images.addObject(UIImage(named: "image13.jpg")!)
        images.addObject(UIImage(named: "image14.jpg")!)
        images.addObject(UIImage(named: "image15.jpg")!)
        images.addObject(UIImage(named: "image16.jpeg")!)
        images.addObject(UIImage(named: "image17.jpg")!)
        images.addObject(UIImage(named: "image18.jpg")!)
        images.addObject(UIImage(named: "image11.jpg")!)
        images.addObject(UIImage(named: "image12.jpg")!)
        images.addObject(UIImage(named: "image13.jpg")!)
        images.addObject(UIImage(named: "image14.jpg")!)
        images.addObject(UIImage(named: "image15.jpg")!)
        images.addObject(UIImage(named: "image16.jpeg")!)
        images.addObject(UIImage(named: "image17.jpg")!)
        images.addObject(UIImage(named: "image15.jpg")!)
        images.addObject(UIImage(named: "image16.jpeg")!)
        images.addObject(UIImage(named: "image17.jpg")!)
        
        randomImageView = RLSRandomImageView(frame: self.view.frame, images: images.copy() as! [UIImage])
        self.view.addSubview(randomImageView)
        var view = UIView(frame: randomImageView.bounds)
        view.backgroundColor = UIColor.blackColor()
        randomImageView.setBackGroundView(randomImageView)
        self.view.backgroundColor = UIColor.whiteColor()
        randomImageView.show(4, heightCount: 7)
    }
    
    override func viewDidAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

