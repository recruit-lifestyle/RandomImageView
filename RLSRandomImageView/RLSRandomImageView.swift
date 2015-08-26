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
    private var imageViewArray: NSMutableArray!
    private var backgroundView: UIView!
    private var screenPixelHeight: CGFloat!
    private var screenPixelWidth: CGFloat!
    internal var widthCount: Int!
    internal var heightCount: Int!
    
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
        imageViewArray = NSMutableArray()
        widthCount = 0
        heightCount = 0
        screenPixelHeight = self.frame.size.height / 667
        screenPixelWidth = self.frame.size.width / 375
    }
    
    func setBackGroundView(backgroundView: UIView){
        self.backgroundView = UIView(frame: self.frame)
        self.backgroundView = backgroundView
    }
    
    func show(var widthCount:Int, var heightCount:Int){
        self.widthCount = widthCount
        self.heightCount = heightCount
        show()
    }
    
    func show(){
        clearSubViews()
        let imageWidth = self.frame.size.width / CGFloat(self.widthCount)
        let imageHeight = imageWidth
        for(var i=0;i<self.heightCount;i++){
            for(var s=0;s<widthCount;s++){
                if(i*self.widthCount+s < self.imageArray.count){
                    var iv = UIImageView(frame: CGRectMake(imageWidth * CGFloat(s), imageHeight * CGFloat(i), imageWidth, imageHeight))
                    iv.image = imageArray[i*self.widthCount+s] as? UIImage
                    iv.contentMode = UIViewContentMode.ScaleAspectFill
                    iv.layer.masksToBounds = true
                    imageViewArray.addObject(iv)
                }
            }
        }
        randomShowImages()
    }
    
    func randomShowImages(){
        var cnt = 0
        var isOpend = NSMutableArray()
        while(cnt < self.imageArray.count){
            var index: UInt32 = arc4random_uniform(UInt32(imageArray.count))
            if(isOpend.containsObject(Int(index)) == false){
                isOpend.addObject(Int(index))
                cnt++
                showAnimation(imageViewArray.objectAtIndex(Int(index)) as! UIImageView , delay: 0.1 * Double(cnt))
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
