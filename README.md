<p align="center">
  <img src="https://imgur.com/X3gdFcF.png" height="400px"/>
</p>

[![Build Status](https://travis-ci.org/corey-rb/juliet.svg?branch=master)](https://travis-ci.org/corey-rb/juliet)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Juliet.svg)](https://cocoapods.org/pods/Juliet)
[![Platform](https://img.shields.io/cocoapods/p/Juliet.svg?style=flat)](http://cocoadocs.org/docsets/Juliet)
[![Swift](http://img.shields.io/badge/swift-3.0-brightgreen.svg)](http://cocoadocs.org/docsets/Juliet)
[![License](https://img.shields.io/cocoapods/l/Juliet.svg?style=flat)](http://cocoadocs.org/docsets/Juliet)



Juliet is a simple, expandable logging library for iOS. It is meant to allow easy logging of application data to any endpoint (stdout, http, etc).

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Output](#output)
- [Contribute](#contribute)
- [License](#license)



## Features
- [x] Singleton Instantiation
- [ ] [Complete Documentation](http://cocoadocs.org/docsets/Juliet)


## Requirements
* Xcode 8.3+
* iOS 10.3+
* Swift 3.1+


## Installation

### Cocoapods
Install [CocoaPods](https://cocoapods.org/) dependency manger:
```shell
gem install cocoapods
```

To integrate Juliet into your project, add the following to your project's Podfile

```
pod 'juliet'
```

### Carthage
Coming Soon.

### Swift Package Manager
Coming Soon.


## Usage

### Configure a Destination
```swift
import Juliet

let consoleDestination = ConsoleOutput()
Logger.add(destination: consoleDestination)
```

### Basic Logging
```swift
import Juliet

Logger.verbose("View Loaded")
Logger.info(Date())
Logger.debug(["Yellow", "Blue", 3])
Logger.warning("Yikes something is not right")
Logger.error("Fatal Error")
```

## Output
![Image](https://imgur.com/0orGsD3.png)

## Contribute
Want to learn Swift and help contribute? [Read Here](https://github.com/corey-rb/juliet/blob/master/CONTRIBUTING.md)


## License
Juliet is released under the MIT license. [See LICENSE](https://github.com/corey-rb/juliet/blob/master/LICENSE) for details.
