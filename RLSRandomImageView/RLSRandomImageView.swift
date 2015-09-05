//
//  RLSRandomImageView.swift
//  RLSRandomImageView
//
//  Created by Nari on 2015/07/14.
//  Copyright (c) 2015年 nari. All rights reserved.
//

import UIKit

class RLSRandomImageView: UIView {
    private var imageArray = [UIImage]()
    var imageViewArray = [UIImageView]()
    private var backgroundView = UIView()
    private var screenPixelHeight = CGFloat(0.0)
    private var screenPixelWidth = CGFloat(0.0)
    var widthCount = 0
    var heightCount = 0
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(frame: CGRect, images: [UIImage]) {
        super.init(frame: frame)
        setup()
        imageArray = images
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        screenPixelHeight = self.frame.size.height / 667
        screenPixelWidth = self.frame.size.width / 375
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
        for i in 0..<self.heightCount {
            for s in 0..<self.widthCount {
                if(i * self.widthCount+s < self.imageArray.count){
                    var imageView = UIImageView(frame: CGRectMake(imageWidth * CGFloat(s), imageHeight * CGFloat(i), imageWidth, imageHeight))
                    imageView.image = imageArray[i*self.widthCount+s]
                    imageView.contentMode = .ScaleAspectFill
                    imageView.layer.masksToBounds = true
                    imageViewArray.append(imageView)
                }
            }
        }
        randomShowImages()
    }
    
    private func randomShowImages(){
        var cnt = 0
        var openedFlgs = [Int]()
        while(cnt < self.imageViewArray.count){
            var index = arc4random_uniform(UInt32(imageViewArray.count))
            if(find(openedFlgs, Int(index)) == nil){
                openedFlgs.insert(Int(index), atIndex: 0)
                cnt++
                showAnimation(imageViewArray[Int(index)], delay: 0.1 * Double(cnt))
            }
        }
    }

    private func showAnimation(var imageView: UIImageView, let delay: Double){
        let masterFrame = imageView.frame
        imageView.frame = CGRectMake(imageView.frame.origin.x + (imageView.frame.size.width - screenPixelWidth)/2, imageView.frame.origin.y + (imageView.frame.size.height - screenPixelHeight)/2, screenPixelWidth, screenPixelHeight)
        self.addSubview(imageView)
        UIView.animateWithDuration(1.0,
            delay: delay,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 20,
            options: nil,
            animations: {
                imageView.frame = masterFrame
        }, completion:nil)
    }
    
    private func clearSubViews(){
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
}
