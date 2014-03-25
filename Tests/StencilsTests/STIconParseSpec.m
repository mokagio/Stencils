//
//  MTFontIconParseSpec.m
//  Tests
//
//  Created by Gio on 14/08/2013.
//
//

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
                                         MTFontIconIconNameKey: anyIconName,
                                         MTFontIconIconCodeKey: anyIconCode,
                                         MTFontIconBaselineAdjustementKey: @(anyBaselineValue),
                                         MTFontIconScaleAdjustementKey: @(anyScaleValue),
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
                                                                  MTFontIconIconNameKey: anyIconName,
                                                                  MTFontIconIconCodeKey: anyIconCode,
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