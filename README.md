<p align="center">
  <img src="https://raw.githubusercontent.com/touyu/BlurKit/docs/docs/BlurKit-Logo.png" width=400>
</p>

<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<img src="https://img.shields.io/badge/platforms-iOS-lightgrey.svg">
<img src="https://img.shields.io/badge/language-Swift%204.2-orange.svg">
<img src="https://img.shields.io/badge/license-MIT-blue.svg">

A lightweight library that can easily blur the view.

## Features
- [x] Without inheritance
- [x] Corresponds to UIView, UIImageView, UILabel etc...
- [x] Adjustable blur condition
- [x] Lightweight

## Usage

<img src="https://github.com/touyu/BlurKit/blob/docs/docs/blur.gif" width=240>

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bk.addBlur(blurRadius: 0)

        UIView.animate(withDuration: 5) {
            self.view.bk.blurRadius = 5
        }
    }
}
``` 
```swift
label.bk.addBlur(blurRadius: 3, colorTint: .white, colorTintAlpha: 0.4)
imageView.bk.addBlur(blurRadius: 4, colorTint: .white, colorTintAlpha: 0.2)
view.bk.removeBlur()
view.bk.isBlurHidden = true // or false
```

## Installation
Add this to `Cartfile`
```
github "touyu/BlurKit" ~> 0.1
```
```
$ carthage update --platform iOS
```

## ⚠️ Caution
Because `BlurKit` uses the Private API, please use it carefully.
