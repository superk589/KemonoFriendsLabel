# ZKCornerRadiusView
![Swift3](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat")
[![Version](https://img.shields.io/cocoapods/v/KemonoFriendsLabel.svg?style=flat)](http://cocoapods.org/pods/KemonoFriendsLabel)
[![License](https://img.shields.io/cocoapods/l/KemonoFriendsLabel.svg?style=flat)](http://cocoapods.org/pods/KemonoFriendsLabel)
[![Platform](https://img.shields.io/cocoapods/p/KemonoFriendsLabel.svg?style=flat)](http://cocoapods.org/pods/KemonoFriendsLabel)  

A subclass of UILabel, drawing text like title in KemonoFriends.

## CocoaPods:
```
platform :ios, '8.0'
use_frameworks!
target 'myApp' do
  pod 'KemonoFriendsLabel'
end
```

## Usage

support for both storyboard and code to create the label

if using in code, call label.sizeToFit() after setting the text.

```swift
let label = KemonoFriendsLabel()
label.numberOfLines = 0
label.text = "Multi-lines\nis also supported"
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 40, weight: 30)
label.sizeToFit()
view.addSubview(label)
label.center = view.center
```

if using in storyboard, make sure not adding constraints to limit the size of label
