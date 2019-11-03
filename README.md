<p align="center">
<img src="Images/Logo.png" width=700>
</p>

<H4 align="center">
Simple and ready-made states for the view controller.
</H4>

<p align="center">
<br>
<a href="https://developer.apple.com/"><img alt="Platform" src="https://img.shields.io/badge/platform-iOS-green.svg"/></a>
<a href="https://cocoapods.org/pods/WaterStates"><img alt="License" src="https://img.shields.io/cocoapods/l/WaterStates.svg"/></a>
<a href="https://github.com/BarredEwe/WaterStates/releases/latest"><img alt="CocoaPods" src="https://img.shields.io/cocoapods/v/WaterStates.svg"/></a>
</br>
<a href="https://developer.apple.com/swift"><img alt="Swift5" src="https://img.shields.io/badge/language-Swift5-orange.svg"/></a>
<a href="https://github.com/topics/viper-architecture?l=swift"><img alt="" src=https://img.shields.io/badge/VIPER-compatible-green"/></a>

---

## Introduction

Are you sure tired of writing the same code in all view controllers? Now you can easily and simply call up the necessary states for display, WaterStates will do the rest.

If you like the project, do not forget to `put star ⭐` and follow me on GitHub.

## Requirements

Xcode `11.0`+, Swift `5.0`+. Ready for use on iOS 9+

## Quick Start

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

<details><summary>VIPER Quick Start</summary><p>

You need to set the `showState` method in the `ViewInput` protocol:

```swift
import WaterStates

protocol ExampleViewInput: class {
    func showState(_ state: DefaultState)
}
```
    
Use the `WaterStates` protocol on the view controller:

```swift
import UIKit
import WaterStates

class ExampleViewController: UIViewController, ExampleViewInput, WaterStates { }
```

In the `Presenter`, we set the view state using the `showState` method:

```swift
import WaterStates

class ExamplePresenter: ExampleViewOutput {

    weak var view: ViewControllerInput?

    func someMethodd() {
        view?.showState(.loading)
    }
}
```

For the action of the states, `ViewOutput` must correspond to a specific state delegate, for example: `ErrorStateDelegate`:

```swift
protocol ExampleViewOutput: ErrorStateDelegate { }

class ExamplePresenter: ExampleViewOutput {

    ...

    func errorActionTapped(with type: StateActionType) {
        // do something
    }
}
```

</p></details>  

## Usage

### Empty state

```swift
showState(.empty)
```

### Error state

```swift
showState(.error)
```

### Loading state

```swift
showState(.loading)
```

### Content state

To use the content state, it is necessary to implement `showContent` method with a type that you need:

```swift
// Content type must be your view model, for example - String
func showContent(_ content: String) {
    // do something with your content
}
```
If you do not need data for the content state, you can not implement the `showContent` method or you can specify the type of content in the `showContent` method, as in `DefaultState` - `Any`:

```swift
func showContent(_ content: Any) {
    // do something
}
```

### Configarations

The rest will be added in the near future 😉!

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
    
Will be added later 😉.
</p></details>  

## Author

BarredEwe, grishutin@bifit.com

## License

`WaterStates` is available under the MIT license. See the LICENSE file for more info.
