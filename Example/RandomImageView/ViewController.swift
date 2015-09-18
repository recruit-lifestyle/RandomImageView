//
//  ViewController.swift
//  RandomImageView
//
//  Created by Nonchalant on 09/18/2015.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit
import RandomImageView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        var images = [
            UIImage(named: "image1")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image4")!,
            UIImage(named: "image5")!,
            UIImage(named: "image6")!,
            UIImage(named: "image7")!,
            UIImage(named: "image8")!,
            UIImage(named: "image9")!,
            UIImage(named: "image10")!,
            UIImage(named: "image11")!,
            UIImage(named: "image12")!,
            UIImage(named: "image13")!,
            UIImage(named: "image14")!,
            UIImage(named: "image15")!,
            UIImage(named: "image16")!,
            UIImage(named: "image17")!,
            UIImage(named: "image18")!,
            UIImage(named: "image10")!,
            UIImage(named: "image11")!,
            UIImage(named: "image12")!,
            UIImage(named: "image13")!,
            UIImage(named: "image14")!,
            UIImage(named: "image15")!,
            UIImage(named: "image16")!,
            UIImage(named: "image17")!,
            UIImage(named: "image18")!,
            UIImage(named: "image18")!
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

