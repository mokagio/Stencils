//
//  STIconParser.h
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

#import <Foundation/Foundation.h>
#import "STIconModel.h"

@interface STParser : NSObject

/**
 *  Parse a dictionary containing the configurations for a set of icon returning an dictionary
 *  which keys are the icons names, and the values instances of `STIconModel`
 *
 *  @param dictionary The raw configurations dictionary
 *
 *  @return A dictionary with icon nmaes as keys and `STIconModel` as values
 */
+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary;

@end

///----------------
/// @name Constants
///----------------

extern NSString * const STIconParserFontKey;

extern NSString * const STIconParserIconsKey;
extern NSString * const STIconParserIconNameKey;
extern NSString * const STIconParserIconCodeKey;
extern NSString * const STIconParserBaselineAdjustementKey;
extern NSString * const STIconParserScaleAdjustementKey;
