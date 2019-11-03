# WaterStates

<H4 align="center">
Simple and ready-made states for the view controller.
</H4>

<p align="center">
<a href="https://github.com/BarredEwe/WaterStates/releases/latest"><img alt="CocoaPods" src="https://img.shields.io/cocoapods/v/WaterStates.svg"/></a>
<a href="https://developer.apple.com/swift"><img alt="Swift5" src="https://img.shields.io/badge/language-Swift5-orange.svg"/></a> 
<a href="https://cocoapods.org/pods/WaterStates"><img alt="License" src="https://img.shields.io/cocoapods/l/WaterStates.svg"/></a>
<a href="https://github.com/topics/viper-architecture?l=swift"><img alt="License" src=https://img.shields.io/badge/VIPER-compatible-green"/></a>
<a href="https://developer.apple.com/"><img alt="Platform" src="https://img.shields.io/badge/platform-iOS-green.svg"/></a>
</p>

---

## Introduction

Are you sure tired of writing the same code in all view controllers? Now you can easily and simply call up the necessary states for display, WaterStates will do the rest.

If you like the project, do not forget to `put star ⭐` and follow me on GitHub:

## Requirements

Swift `5.0`. Ready for use on iOS 9+

## Usage

Use the `WaterStates` protocol on the view controller and invoke the state you need using the `showState` method.

```swift
import UIKit
import WaterStates

class ExampleViewController: UIViewController, WaterStates {

    override func viewDidLoad() {
        super.viewDidLoad()
        showState(.loading)
    }
}
```

For the action of the states, you need to correspond to a delegate of a certain state, for example: `ErrorStateDelegate`.

```swift
extension ExampleViewController: ErrorStateDelegate {
    func errorActionTapped(with type: StateActionType) {
        // do something
    }
}
```

## Installation

<details><summary>CocoaPods</summary>
<p>

WaterStates is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WaterStates'
```
</p>  
</details>

<details><summary>Swift package manager</summary><p>
    
Will be added later.
</p></details>  

## Author

BarredEwe, grishutin@bifit.com

## License

`WaterStates` is available under the MIT license. See the LICENSE file for more info.
