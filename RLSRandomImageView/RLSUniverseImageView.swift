//
//  RLSUniverseImageView.swift
//  RLSRandomImageView
//
//  Created by Nari on 2015/07/14.
//  Copyright (c) 2015年 nari. All rights reserved.
//

import UIKit

class RLSUniverseImageView: UIView , UIScrollViewDelegate{
    internal var imageViewArray: NSMutableArray!
    private var imageArray: NSMutableArray!
    private var backgroundView: UIView!
    private var scrollView: UIScrollView!
    private var screenWidth, screenHeight, padding, sideSize: CGFloat!
    private var scrollBeginingPoint: CGPoint!
    private var direction: Int!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup(){
        imageViewArray = NSMutableArray()
        imageArray = NSMutableArray()
        screenWidth = UIScreen.mainScreen().bounds.width/1000
        screenHeight = UIScreen.mainScreen().bounds.height/1000
        padding = screenWidth * 15
        sideSize = screenWidth * 1000
        scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.layer.masksToBounds = true
        scrollView.bounces = true
        scrollView.delegate = self
        scrollView.directionalLockEnabled = true
    }
    
    internal func convertImageView(){
        var mainContentView = UIView(frame: CGRectMake(0, (screenHeight*1000 - sideSize)/2, sideSize * CGFloat(imageViewArray.count), scrollView.frame.size.height))
        for(var i=0;i<self.imageViewArray.count;i++){
            var iv = imageViewArray.objectAtIndex(i) as! UIImageView
            iv.userInteractionEnabled = true
            var tapGesture = UITapGestureRecognizer(target: self, action: "tapPicture:")
            iv.addGestureRecognizer(tapGesture)
            iv.tag = i
            imageArray.addObject(iv.image!)
            
            var contentView = UIView(frame: CGRectMake(screenWidth * CGFloat(1000) * CGFloat(i), 0, sideSize, sideSize))
            var bigIv = UIImageView(frame: CGRectMake(0, 0, sideSize, sideSize))
            bigIv.backgroundColor = UIColor.redColor()
            bigIv.image = iv.image!
            bigIv.layer.masksToBounds = true
            bigIv.contentMode = UIViewContentMode.ScaleAspectFill
            contentView.addSubview(bigIv)
            mainContentView.addSubview(contentView)
        }
        scrollView.contentSize = CGSizeMake(mainContentView.bounds.size.width,  screenHeight*2000)
        if(scrollView.subviews.count > 0){
            scrollView.subviews[0].removeFromSuperview()
        }
        scrollView.addSubview(mainContentView)
    }
    
    func tapPicture(sender: UITapGestureRecognizer){
        var iv = sender.view as! UIImageView
        showBackGroundView()
        showBigImageView(iv.tag)
    }
    
    func showBigImageView(var index: Int){
        let p = CGPointMake(screenWidth*CGFloat(1000*index),0)
        scrollView.bounds = CGRectMake(p.x, p.y, scrollView.bounds.width, scrollView.bounds.height)
        scrollView.alpha = 0.0
        self.superview?.addSubview(scrollView)
        UIView.animateWithDuration(0.4,
            animations: { () -> Void in
                self.scrollView.alpha = 1.0
        })
    }
    
    func showBackGroundView(){
        backgroundView = UIView(frame: self.bounds)
        self.superview?.addSubview(backgroundView)
        let blurEffect = UIBlurEffect(style:.Light)
        let visualEffectView = UIVisualEffectView(effect:blurEffect)
        visualEffectView.frame = self.frame
        visualEffectView.contentView.addSubview(scrollView)
        backgroundView.addSubview(visualEffectView)
        backgroundView.alpha = 0.0
        UIView.animateWithDuration(0.4,
            animations: { () -> Void in
                self.backgroundView.alpha = 1.0
        })
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginingPoint = scrollView.contentOffset;
        direction = 0
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollBeginingPoint == nil || direction == nil){return}

        var currentPoint = scrollView.contentOffset
        var moveHorizontal = abs( currentPoint.x - scrollBeginingPoint.x )
        var moveVertical = abs( currentPoint.y - scrollBeginingPoint.y )
        if (direction == 0) {
            if ( !CGPointEqualToPoint( currentPoint, scrollBeginingPoint ) ) {
                if ( moveHorizontal < moveVertical ) {
                    self.direction = 1;
                } else {
                    self.direction = 2;
                }
            }
        }
        if (direction == 2) {
            currentPoint.y = scrollBeginingPoint.y
            scrollView.contentOffset = currentPoint
        } else if (direction == 1) {
            currentPoint.x = scrollBeginingPoint.x
            scrollView.contentOffset = currentPoint
        }
        
        backgroundView.alpha = (100 - sqrt(moveVertical*20)) / 100.0
        if((100 - sqrt(moveVertical*20)) / 100.0 < 0){
            backgroundView.removeFromSuperview()
            scrollView.removeFromSuperview()
        }
    }
    
}
