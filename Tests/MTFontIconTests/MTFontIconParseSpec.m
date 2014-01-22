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
    __block NSDictionary *anIconDict = @{
                                         MTFontIconParserFontKey: anyFontFileName,
                                         MTFontIconIconNameKey: anyIconName,
                                         MTFontIconIconCodeKey: anyIconCode
                                         };
    __block NSArray *settings = @[ anIconDict ];
    
    __block NSDictionary *icons;
    
    beforeAll(^{
        icons = [MTFontIconParser parseFontIconsFromArray:settings];
    });
    
    it(@"should parse an array of dictionaries into a dictionary of MTFontIconModel instances", ^{
        
        [icons enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            BOOL isExpectedClass = [obj isKindOfClass:[MTFontIconModel class]];
            [[theValue(isExpectedClass) should] beTrue];
        }];
    });
    
    it(@"should return a MTFontIconModel with the correct fontName prorperty", ^{
        MTFontIconModel *model = icons[anyIconName];
        [[model.fontName should] equal:anyFontFileName];
    });
    
    it(@"should return a MTFontIconModel with the correct code prorperty", ^{
        MTFontIconModel *model = icons[anyIconName];
        [[model.code should] equal:anyIconCode];
    });
});

SPEC_END