//
//  MTFontIconParseSpec.m
//  Tests
//
//  Created by Gio on 14/08/2013.
//
//

#import <Kiwi.h>
#import "MTFontIconParser.h"

SPEC_BEGIN(MTFontIconParserSpec)

describe(@"MTFontIconParser", ^{
    __block NSString *anyIconName = @"an-icon";
    __block NSString *anyIconCode = @"\ue000";
    __block NSString *anyFontFileName = @"a-font-file-name";
    __block CGFloat anyLeftValue = 1.1;
    __block CGFloat anyTopValue = 2.2;
    __block NSDictionary *anIconDict = @{
                                         MTFontIconParserFontKey: anyFontFileName,
                                         MTFontIconIconNameKey: anyIconName,
                                         MTFontIconIconCodeKey: anyIconCode,
                                         MTFontIconPaddingLeftKey: @(anyLeftValue),
                                         MTFontIconPaddingTopKey: @(anyTopValue),
                                         };
    __block NSArray *settings = @[ anIconDict ];
    
    __block NSDictionary *icons;
    __block MTFontIconModel *model;
    
    beforeAll(^{
        icons = [MTFontIconParser parseFontIconsFromArray:settings];
        model = icons[anyIconName];
    });
    
    it(@"should parse an array of dictionaries into a dictionary of MTFontIconModel instances", ^{
        [icons enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            BOOL isExpectedClass = [obj isKindOfClass:[MTFontIconModel class]];
            [[theValue(isExpectedClass) should] beTrue];
        }];
    });
    
    it(@"should return a MTFontIconModel with the correct fontName prorperty", ^{
        [[model.fontName should] equal:anyFontFileName];
    });
    
    it(@"should return a MTFontIconModel with the correct code prorperty", ^{
        [[model.code should] equal:anyIconCode];
    });
    
    it(@"should return a MTFontIconModel with the correct paddingLeft prorperty", ^{
        [[theValue(model.paddingLeft) should] equal:theValue(anyLeftValue)];
    });
    
    it(@"should return a MTFontIconModel with the correct paddingTop prorperty", ^{
        [[theValue(model.paddingTop) should] equal:theValue(anyTopValue)];
    });
    
    describe(@"when parsing an icon dictionary without the optional values", ^{
        __block NSDictionary *anIconDictWithoutOptionalValues = @{
                                                                  MTFontIconParserFontKey: anyFontFileName,
                                                                  MTFontIconIconNameKey: anyIconName,
                                                                  MTFontIconIconCodeKey: anyIconCode,
                                                                  };
        __block MTFontIconModel *defaultModel = [[MTFontIconModel alloc] init];
        
        beforeAll(^{
            model = [MTFontIconParser parseFontIconsFromArray:@[anIconDictWithoutOptionalValues]][anyIconName];
        });
        
        it(@"should return a MTFontIconModel with the default paddingLeft prorperty", ^{
            [[theValue(model.paddingLeft) should] equal:theValue(defaultModel.paddingLeft)];
        });
        
        it(@"should return a MTFontIconModel with the defauld paddingTop prorperty", ^{
            [[theValue(model.paddingTop) should] equal:theValue(defaultModel.paddingTop)];
        });
    });
    
});

SPEC_END