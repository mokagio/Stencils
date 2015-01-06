//
//  STIconModel.h
//
//  Copyright (c) 2014 Giovanni Lodi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface STIconModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *fontName;

/**
 *  Optional adjustement value to compensate an eventual vertical offset of the custom font from 
 *  the baseline.
 *  This value is multiplied with the requested height of the icon to get the actual size the icon
 *  should have to avoid croppings.
 *  Usually used in combination with `scaleAdjustement`.
 *
 *  Default is 1.
 *
 *  Tip: try values > 1.
 *
 *  @see scaleAdjustement
 */
@property (nonatomic, assign) CGFloat baselineAdjustement;

/**
 *  Optional scale factor for the view. Usually used in combination with `baselineAdjustement` to
 *  compensate an eventual offset of the custom font from the baseline.
 *
 *  Default is 1.
 *
 *  Tip: since using a `baselineAdjustement` will make the icon bigger, use values < 1.
 *
 *  @see baselineAdjustement
 */
@property (nonatomic, assign) CGFloat scaleAdjustement;

@end
