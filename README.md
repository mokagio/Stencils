MTFontIcon
==========

[![Stories in Ready](https://badge.waffle.io/mokagio/MTFontIcon.png)](http://waffle.io/mokagio/MTFontIcon)
<br/>
[![Build Status](https://travis-ci.org/mokagio/MTFontIcon.png)](https://travis-ci.org/mokagio/MTFontIcon.png)

> Speedup iOS app development with font based icons!

##Important
The project is still a **WIP**! It's intended to become a public pod asap, but only when considered stable enough.

See 0.0.1 milestone (_link needed_) for the current WIP tasks or click on the stories badge above to see how the work is going.


##Install

Via [CocoaPods](http://cocoapods.org).

	pod 'MTFontIcon'

or

	pod 'MTFontIcon', ~> '1.0.0'

##Usage

Add your `.ttf` file to the project.

Configure the icons-unicode matches in the `MTFontIcon.plist`

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

###How to install the pod

`MTFontIcon` isn't ready to be a published as a pod yet. But if you really want to use it, as your own risk, just add this line to your `Podfile`

	pod 'MTFontIcon', :git => 'git@github.com:mokagio/MTFontIcon.git'

###Usage with IcoMoon
_TODO_

###Usage with Font Custom
_TODO_

###Roadmap
_TODO_

###Contribute
_TODO_

<hr/>


Made with &#x2665; by [@LiquidImage_](https://twitter.com/liquidimage_/) and [@mokagio](https://twitter.com/mokagio)
