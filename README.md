MTFontIcon
==========

[![Stories in Ready](https://badge.waffle.io/mokagio/MTFontIcon.png)](http://waffle.io/mokagio/MTFontIcon)
<br/>
[![Build Status](https://travis-ci.org/mokagio/MTFontIcon.png)](https://travis-ci.org/mokagio/MTFontIcon.png)

> Speedup iOS app development with font based icons!

##Install

Via [CocoaPods](http://cocoapods.org).

	pod 'MTFontIcon'

or

	pod 'MTFontIcon', ~> '1.0.0'

##Usage

Add your `.ttf` file to the project, naming it `font-icon.ttf`

Configure the icons-unicode matches in the `MTFontIcon.plist`, which is structured like this

	{
		'font-icons': [
				{'icon-name' : 'arrow-left', 'icon-code' : 'e000' },
				{'icon-name' : 'arrow-right', 'icon-code' : 'e001' }
		]
	}
	
The icon code has to be in the hex format.

In your views use `MTFontIconView`

	#import <MTFontIconFactory.h>
	
	MTFontIconFactory *factory = [[MTFontIconFactory alloc] init];
	MTFontIconView *arrow = [iconFactory iconViewForIconNamed:@'arrow-left' withSide:60.0f];

You can customize your icon like this:

	arrow.background = [UIColor white];
	arrow.color = [UIColor black];
	arrow.shadowColor = [UIColor gray];
	arrow.shadowOffset = CGSizeMake(1.0f, 1.0f);

###Usage with IcoMoon

[icomoon.io](http://icomoon.io) is a really cool service that lets you aggregate font icons form different sets and your custom SVG as well, all in a single `.ttf`

Nothing else to say. Just generate your file, add it to the app and follow the instructions at the beginning of this section.

##Roadmap

* Test with other font icon generators, such as [Font Custom](http://fontcustom.com/).
* Free file name, not fixed to `font-icon.ttf`.
* Improve `MTFontIconView` using [Core Text](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/CoreText_Programming/Introduction/Introduction.html)
* Helper, Ruby script/gem, to completely automate the setup. See `add_font.rb`, still WIP.
* Helper to speedup the `MTFontIcon.plist` configuration. _Single page webapp?_

##Contribute

1. Fork the repo
2. Checkout a new branch `username/feature_name`
3. Open a Pull Request

===

Made with &#x2665; by [@LiquidImage_](https://twitter.com/liquidimage_/) and [@mokagio](https://twitter.com/mokagio)
