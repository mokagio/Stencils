Stencils
==========

[![Build Status](https://travis-ci.org/mokagio/Stencils.png)](https://travis-ci.org/mokagio/Stencils.png)
[![Stories in Ready](https://badge.waffle.io/mokagio/Stencils.png)](http://waffle.io/mokagio/Stencils)
[![Pod Version](http://cocoapod-badges.herokuapp.com/v/Stencils/badge.png
)](http://cocoapod-badges.herokuapp.com/v/$PODNAME/badge.png
)
[![Pod Version](http://cocoapod-badges.herokuapp.com/p/Stencils/badge.png
)](http://cocoapod-badges.herokuapp.com/p/$PODNAME/badge.png
)

**Speedup your iOS app development using icon fonts!**

<img src="https://raw.githubusercontent.com/mokagio/Stencils/master/Screenshots/animated_screenshot.gif" />

Icon fonts are very popular in the web development world. And they are [awesome](https://css-tricks.com/examples/IconFont/). With Stencils you can now access the power and awesomeness of icon fonts in the development of your iOS app, and save a lot of emails with the designer to get the new asset with the shadow 0.5 point more to the left and 3.141592% less opaque.

## Install

Via [CocoaPods](http://cocoapods.org).

	pod 'Stencils'

or

	pod 'Stencils', ~> 'x.x.x'

where `x.x.x` is the version number you want. Latest stable is [![Pod Version](http://cocoapod-badges.herokuapp.com/v/Stencils/badge.png
)](http://cocoapod-badges.herokuapp.com/v/$PODNAME/badge.png
)

## Usage

Three simple steps:

#### 1. Add your icon font file to the project

Just add the `.ttf` to the project. No `Info.plist` update needed! And you can even add multiple icon fonts.

#### 2. Define your icons

Stencils needs to know how to read the font file. Create a configuration file, by default Stencils will look for `Stencils.plist`, in this fashion:

```
font-icons	Array
	Item 0	Dictionary
		font-name				String	The name of the font where the icon is located
		icon-name				String	The name to use to load the icon
		icon-code				String	The unicode caracter corresponding to the icon
										i.e: e001
		baseline-adjustement	Number	(Optional) A correction value to compensate eventual offset from the baseline
		scale-adjustement		Number	(Optional) A correction value to change the scale of the icon. Usually used with "baseline-adjustement"
```

Have a look at the example projects to see how a real configurations `plist` looks like.

#### 3. Load icons using `STIconsFactory` and `STIconView`

```objc
#import <StencilsFactory.h>

STIconsFactory *factory = [[StencilsFactory alloc] init];
STIconView *arrow = [iconFactory iconViewForIconNamed:@'arrow-left' withSide:60.0f];
```

You can customize your icon like this:

```objc
arrow.background = [UIColor white];
arrow.color = [UIColor black];
// If no color is set the icon will use the tintColor of its superview
arrow.shadowColor = [UIColor gray];
arrow.shadowOffset = CGSizeMake(1.0f, 1.0f);
```

### Tuning the icons metrics

It can happen that the icons are rendered _cropped_. This is due to the original font metrics not being _as iOS would like them_. `baseline-adjustement` and `scale-adjustement` are there to compensate this issue.

To help you fine tune those values there's the **IconSettings** app from this repo. You can load your _raw_ `.plist`, launch it on a device, tune each icon, then email yourself the _tuned_ `.plist`. It's a rather sub-optimal approach, but... it works.

## `.plist` generator script

Use the experimental `plist_generator.rb` script located in the `Scripts` folder to generate the `Stencils.plist` to import together with the `.ttf` font in your app from the `.css` that you would use for the webfont.

Run `plist_generator.rb --help`

**Important note:** the script is _experimental_, that is I cannot guarantee it's gonna work 100% of the times. I tried it only on the css files that [IcoMoon](http://icomoon.io/) and [Fontello](http://fontello.com/) generate.

## Where to find icons fonts

* [IcoMoon](http://icomoon.io/)
* [Fontello](http://fontello.com/)
* [GitHub Icon Fonts Showcase](https://github.com/showcases/icon-fonts)
* [CSS Tricks](http://css-tricks.com/flat-icons-icon-fonts/)
* _Know another one? Open a Pull Request!_

## Contribute

1. Fork the repo
2. Checkout a new branch `username/feature_name`
3. Open a Pull Request

===

Made with &#x2665; by [@mokagio](https://twitter.com/mokagio). Special thanks to [@tancdev](https://twitter.com/tancdev/).
