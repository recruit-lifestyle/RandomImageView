//
//  RLSAmbguousImageView.swift
//  RLSRandomImageView
//
//  Created by Nari on 2015/07/14.
//  Copyright (c) 2015年 nari. All rights reserved.
//

import UIKit

class RLSAmbguousImageView: UIView {
    var image: UIImage!
    var picture: UIImageView!
    var shadowView: UIView!
    var closeView: UIView!
    var picSubView: UIView!
    var parentViewController: UIViewController!
    var showedPicture: Bool!
    var showedSubViews: Bool!
    var superRect: CGRect!
    var showPictureRect: CGRect!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        self.backgroundColor = UIColor.clearColor()
        showedPicture = false
        showedSubViews = false
        var screenWidth = UIScreen.mainScreen().bounds.size.width
        var screenHeight = UIScreen.mainScreen().bounds.size.height
        showPictureRect = CGRectMake(0, (screenHeight - screenWidth)/2, screenWidth, screenWidth)
        shadowView = UIView(frame: UIScreen.mainScreen().bounds)
        shadowView.backgroundColor = UIColor.blackColor()
        closeView = UIView(frame: CGRectMake(self.shadowView.frame.size.width-30, 30, 15, 15))
        
        var path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, 0))
        path.addLineToPoint(CGPointMake(self.closeView.frame.size.width, self.closeView.frame.size.height))
        path.moveToPoint(CGPointMake(self.closeView.frame.size.width, 0))
        path.addLineToPoint(CGPointMake(0, self.closeView.frame.size.height))
        
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        closeView.layer.addSublayer(shapeLayer)
        let tapClose = UITapGestureRecognizer(target: self, action: "showSmallPicture:")
        closeView.addGestureRecognizer(tapClose)
        
        picSubView = UIView(frame: CGRectMake(0, (self.shadowView.frame.size.height - self.shadowView.frame.size.width)/2 + self.shadowView.frame.size.width, self.shadowView.frame.size.width, (self.shadowView.frame.size.height - self.shadowView.frame.size.width)/2))
        picSubView.backgroundColor = UIColor.clearColor()
        self.layer.masksToBounds = true
    }
    
    func show(){
        picture = UIImageView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        picture.image = self.image
        picture.contentMode = UIViewContentMode.ScaleAspectFill
        var tapGesture = UITapGestureRecognizer(target: self, action: "tapPicture:")
        var panGesture = UIPanGestureRecognizer(target: self, action: "panPicture:")
        picture.addGestureRecognizer(tapGesture)
        picture.addGestureRecognizer(panGesture)
        self.addSubview(picture)
        picture.userInteractionEnabled = true
    }
    
    internal func tapPicture(sender: UITapGestureRecognizer){
        if(!showedPicture){
            showedPicture = true;
            showedSubViews = true;
            showBigPicture()
        }else if(showedSubViews == true){
            showedSubViews = false
        }else{
            showedSubViews = true
        }
    }
    
    func showSmallPicture(sender: UITapGestureRecognizer){
        showedPicture = false
        animationPicSmall()
    }
    
    func showBigPicture(){
        shadowView.alpha = 0.0
        var p = getRootPoint(self.picture)
        picture.removeFromSuperview()
        superRect = CGRectMake(p.x, p.y, self.picture.frame.size.width, self.picture.frame.size.height)
        picture.frame = superRect
        animationPicBig()
    }

    func animationPicSmall(){
        UIView.animateWithDuration(0.8,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.8,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.shadowView.alpha = 0.0
                self.picture.frame = self.superRect
        }) { (animated) -> Void in
            self.picture.removeFromSuperview()
            self.shadowView.removeFromSuperview()
            self.picture.frame = self.bounds
            self.addSubview(self.picture)
        }
    }

    func animationPicBig(){
        UIView.animateWithDuration(0.8,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.8,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.shadowView.alpha = 1.0
                self.picture.frame = self.showPictureRect
            }) { (animated) -> Void in
                self.CFparentViewController().view.addSubview(self.shadowView)
                self.CFparentViewController().view.addSubview(self.picture)
        }
    }
    
    func getRootPoint(var view: UIView?)-> CGPoint{
        var resultPoint = CGPointZero
        while(view != nil){
            resultPoint.x += view!.frame.origin.x
            resultPoint.y += view!.frame.origin.y
            view = view!.superview
        }
        return resultPoint
    }
    
    func CFparentViewController() -> UIViewController{
        var topController:UIViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as UIViewController!
        while(topController.presentedViewController != nil){
            topController = topController.presentedViewController!
            println(topController.description)
        }
        return topController
    }
}
