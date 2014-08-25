# BCBalancedMultilineLabel

[![CI Status](http://img.shields.io/travis/pivotal-brian-croom/BCBalancedMultilineLabel.svg?style=flat)](https://travis-ci.org/pivotal-brian-croom/BCBalancedMultilineLabel)
[![Version](https://img.shields.io/cocoapods/v/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)
[![License](https://img.shields.io/cocoapods/l/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)
[![Platform](https://img.shields.io/cocoapods/p/BCBalancedMultilineLabel.svg?style=flat)](http://cocoadocs.org/docsets/BCBalancedMultilineLabel)

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

![Regular Label](Screenshots/Balanced-Label.png?raw=true)

## Usage

Using BCBalancedMultilineLabel in your project couldn't be easier! Just change the class of your label
in Interface Builder or in your code to be BCBalancedMultilineLabel instead of UILabel, and you're done!

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Example App](Screenshots/Example-App.png?raw=true)

## Installation

BCBalancedMultilineLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "BCBalancedMultilineLabel"

## Author

Brian Croom, brian.s.croom@gmail.com

## License

BCBalancedMultilineLabel is available under the MIT license. See the LICENSE file for more info.
