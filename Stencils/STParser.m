//
//  STIconParser.m
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

#import "STParser.h"
#import "STIconModel.h"

NSString * const STIconParserIconsKey = @"font-icons";

NSString * const STIconParserFontKey = @"font-name";
NSString * const STIconParserIconNameKey = @"icon-name";
NSString * const STIconParserIconCodeKey = @"icon-code";
NSString * const STIconParserBaselineAdjustementKey = @"baseline-adjustement";
NSString * const STIconParserScaleAdjustementKey = @"scale-adjustement";

@implementation STParser

+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary
{
    return [self parseFontIconsFromArray:dictionary[STIconParserIconsKey]];
}

+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array
{
    NSMutableDictionary *iconsDict = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dataDict, NSUInteger idx, BOOL *stop) {
        STIconModel *model = [[STIconModel alloc] init];
        NSString *name = dataDict[STIconParserIconNameKey];
        model.name = name;
        model.code = dataDict[STIconParserIconCodeKey];
        model.fontName = dataDict[STIconParserFontKey];
        if (dataDict[STIconParserBaselineAdjustementKey]) {
            model.baselineAdjustement = [dataDict[STIconParserBaselineAdjustementKey] floatValue];
        }
        if (dataDict[STIconParserScaleAdjustementKey]) {
            model.scaleAdjustement = [dataDict[STIconParserScaleAdjustementKey] floatValue];
        }
        iconsDict[name] = model;
    }];
    return [NSDictionary dictionaryWithDictionary:iconsDict];
}

@end
