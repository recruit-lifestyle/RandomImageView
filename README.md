#RandomImageView
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/RandomImageView.svg)](https://img.shields.io/cocoapods/v/RandomImageView.svg)

Swift subclass of the UIView.

#Screenshot
![RandomImageView](https://github.com/recruit-lifestyle/RandomImageView/wiki/GIF/sample.gif)  

## Requirements

- iOS 8.0+
- Xcode 6.1


#Installation

Just add the `RandomImageView` folder to your project.

#Usage
There is a need to set up `widthCount` and `heightCount` property of the view.
The widthCount and heightCount will change to Horizonal and Verticalsize one side of images in the view.

1. Create a new UIView in your storyboard or nib.

2. Set the class of the UIView to RandomImageView in your Storyboard or nib.

3. Set `widthCount` and `heightCount` for the view.

4. call `show` method at the timing you want to call.


#Example

``` swift
var images = [
  UIImage(named: "image1.jpg")!,
  UIImage(named: "image2.jpg")!,
  UIImage(named: "image3.jpg")!
]


randomImageView = RandomImageView(frame: self.view.frame, images: images)
self.view.addSubview(randomImageView)
randomImageView.show(4, heightCount: 7)

```


## Credits

RandomImageView is owned and maintained by [RECRUIT LIFESTYLE CO., LTD.](http://www.recruit-lifestyle.co.jp/)

RandomImageView was originally created by [Narimasa Iwabuchi](https://github.com/NariFrow)  


##License

    Copyright 2015 RECRUIT LIFESTYLE CO., LTD.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


  
