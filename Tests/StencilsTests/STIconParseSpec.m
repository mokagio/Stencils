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

#import <Kiwi.h>
#import "STParser.h"

SPEC_BEGIN(STIconParserSpec)

describe(@"STIconParser", ^{
    __block NSString *anyIconName = @"an-icon";
    __block NSString *anyIconCode = @"\ue000";
    __block NSString *anyFontFileName = @"a-font-file-name";
    __block CGFloat anyBaselineValue = 1.1;
    __block CGFloat anyScaleValue = 2.2;
    __block NSDictionary *anIconDict = @{
                                         STIconParserFontKey: anyFontFileName,
                                         STIconParserIconNameKey: anyIconName,
                                         STIconParserIconCodeKey: anyIconCode,
                                         STIconParserBaselineAdjustementKey: @(anyBaselineValue),
                                         STIconParserScaleAdjustementKey: @(anyScaleValue),
                                         };
    __block NSDictionary *settings = @{ @"font-icons": @[ anIconDict ] };
    
    __block NSDictionary *icons;
    __block STIconModel *model;
    
    beforeAll(^{
        icons = [STParser parseFontIconsFromDictionary:settings];
        model = icons[anyIconName];
    });
    
    it(@"should parse a dictionaries of configurations into a dictionary of STIconModel instances", ^{
        [icons enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            BOOL isExpectedClass = [obj isKindOfClass:[STIconModel class]];
            [[theValue(isExpectedClass) should] beTrue];
        }];
    });
    
    it(@"should return a STIconModel with the correct fontName prorperty", ^{
        [[model.fontName should] equal:anyFontFileName];
    });
    
    it(@"should return a STIconModel with the correct code prorperty", ^{
        [[model.code should] equal:anyIconCode];
    });
    
    it(@"should return a STIconModel with the correct baselineAdjustement prorperty", ^{
        [[theValue(model.baselineAdjustement) should] equal:theValue(anyBaselineValue)];
    });
    
    it(@"should return a STIconModel with the correct baselineAdjustement prorperty", ^{
        [[theValue(model.scaleAdjustement) should] equal:theValue(anyScaleValue)];
    });
    
    describe(@"when parsing an icon dictionary without the optional values", ^{
        __block NSDictionary *anIconDictWithoutOptionalValues = @{
                                                                  STIconParserFontKey: anyFontFileName,
                                                                  STIconParserIconNameKey: anyIconName,
                                                                  STIconParserIconCodeKey: anyIconCode,
                                                                  };
        __block STIconModel *defaultModel = [[STIconModel alloc] init];
        
        beforeAll(^{
            model = [STParser parseFontIconsFromDictionary:@{ @"font-icons": @[ anIconDictWithoutOptionalValues ] }][anyIconName];
        });
        
        it(@"should return a STIconModel with the default baselineAdjustement prorperty", ^{
            [[theValue(model.baselineAdjustement) should] equal:theValue(defaultModel.baselineAdjustement)];
        });
        
        it(@"should return a STIconModel with the defauld baselineAdjustement prorperty", ^{
            [[theValue(model.scaleAdjustement) should] equal:theValue(defaultModel.scaleAdjustement)];
        });
    });
    
});

SPEC_END