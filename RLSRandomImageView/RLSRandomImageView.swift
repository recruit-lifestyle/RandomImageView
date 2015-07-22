//
//  RLSRandomImageView.swift
//  RLSRandomImageView
//
//  Created by Nari on 2015/07/14.
//  Copyright (c) 2015年 nari. All rights reserved.
//

import UIKit

class RLSRandomImageView: UIView {
    private var imageArray: NSMutableArray!
    private var backgroundView: UIView!
    internal var width_count: Int!
    internal var height_count: Int!
    private var screenPixelHeight: CGFloat!
    private var screenPixelWidth: CGFloat!
    private var universeImageView: RLSUniverseImageView!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect, images: NSMutableArray) {
        super.init(frame: frame)
        setup()
        imageArray = images
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        imageArray = NSMutableArray()
        width_count = 0
        height_count = 0
        screenPixelHeight = self.frame.size.height / 667
        screenPixelWidth = self.frame.size.width / 375
    }
    
    func setBackGroundView(backgroundView: UIView){
        self.backgroundView = UIView(frame: self.frame)
        self.backgroundView = backgroundView
    }
    
    func show(var width_count:Int, var height_count:Int){
        self.width_count = width_count
        self.height_count = height_count
        show()
    }
    
    func show(){
        clearSubViews()
        universeImageView = RLSUniverseImageView(frame: UIScreen.mainScreen().bounds)
        self.addSubview(universeImageView)
        let imageWidth = self.frame.size.width / CGFloat(self.width_count)
        let imageHeight = imageWidth
        for(var i=0;i<self.height_count;i++){
            for(var s=0;s<width_count;s++){
                if(i*self.width_count+s < self.imageArray.count){
                    var iv = UIImageView(frame: CGRectMake(imageWidth * CGFloat(s), imageHeight * CGFloat(i), imageWidth, imageHeight))
                    iv.image = imageArray[i*self.width_count+s] as? UIImage
                    iv.contentMode = UIViewContentMode.ScaleAspectFill
                    iv.layer.masksToBounds = true
                    universeImageView.imageViewArray.addObject(iv)
                }
            }
        }
        universeImageView.convertImageView()
        randomShowImages()
    }
    
    func randomShowImages(){
        var cnt = 0
        var isOpend = NSMutableArray()
        while(cnt < universeImageView.imageViewArray.count){
            var index: UInt32 = arc4random_uniform(UInt32(self.universeImageView.imageViewArray.count))
            if(isOpend.containsObject(Int(index)) == false){
                isOpend.addObject(Int(index))
                cnt++
                showAnimation(universeImageView.imageViewArray.objectAtIndex(Int(index)) as! UIImageView , delay: 0.1 * Double(cnt))
            }
        }
    }

    func showAnimation(var iv: UIImageView, let delay: Double){
        let masterFrame = iv.frame
        iv.frame = CGRectMake(iv.frame.origin.x + (iv.frame.size.width - screenPixelWidth)/2, iv.frame.origin.y + (iv.frame.size.height - screenPixelHeight)/2, screenPixelWidth, screenPixelHeight)
        self.addSubview(iv)
        UIView.animateWithDuration(1.0,
            delay: delay,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 20,
            options: nil,
            animations: {
                iv.frame = masterFrame
        }, completion:nil)
    }
    
    func clearSubViews(){
        for(var i=0;i<self.subviews.count;i++){
            self.subviews[i].removeFromSuperview()
        }
    }
    
}
