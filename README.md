# BCBalancedMultilineLabel

[![CI Status](http://img.shields.io/travis/briancroom/BCBalancedMultilineLabel.svg?style=flat)](https://travis-ci.org/briancroom/BCBalancedMultilineLabel)
[![Version](https://img.shields.io/cocoapods/v/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)
[![License](https://img.shields.io/cocoapods/l/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)
[![Platform](https://img.shields.io/cocoapods/p/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Have you ever placed a label in your view controller, gave it some nice copy to display, 
ran your app and then cringed because everything fit on one line except for one or two
lone words?

![Regular Label](Screenshots/Regular-Label.png?raw=true)

Your first reaction to this might be to run over to Interface Builder and adjust
the label's width so that the lines are more even. But what happens when you need to show different
text? Or you localize your app? Or adopt dynamic type? In these situations, keeping things working
becomes a maintenance nightmare.

BCBalancedMultilineLabel will take care of adjusting the line breaks such that each
line is as close to the same length as possible, making your text look beautiful. It supports
left, right, and center alignments equally well.

![Balanced Label](Screenshots/Balanced-Label.png?raw=true)
![Balanced Label Right Aligned](Screenshots/Balanced-Label-Right.png?raw=true)

It also simplifies handling a couple of other `UILabel` properties:

* `numberOfLines` is defaulted to `0`, as this label is intended to be used for content that wraps to multiple lines.
* `preferredMaxLayoutWidth` is automatically kept in sync with the label's frame width, which helps ensure that the label sizes itself as intended when used with autolayout.

## Usage

Using BCBalancedMultilineLabel in your project couldn't be easier! Just change the class of your label
in Interface Builder or in your code to be BCBalancedMultilineLabel instead of UILabel, and you're done!

```objective-c
UILabel *label = [[BCBalancedMultilineLabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Example App](Screenshots/Example-App.gif?raw=true)

## Installation

BCBalancedMultilineLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "BCBalancedMultilineLabel"

It can also be installed as a framework using [Carthage](https://github.com/Carthage/Carthage) if you are targeting iOS 8.0 or above. To get it this way, add the following line to your Cartfile:

    github "briancroom/BCBalancedMultilineLabel"

## Author

Brian Croom, brian.s.croom@gmail.com

## License

BCBalancedMultilineLabel is available under the MIT license. See the LICENSE file for more info.
