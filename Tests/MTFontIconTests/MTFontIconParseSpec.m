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
   
    it(@"should parse am array of dictionaries in the standard format into a 'name:code' dictionary", ^{
        NSString *anyIconName = @"an-icon";
        NSString *anyIconCode = @"\ue000";
        NSDictionary *anIconDict = @{MTFontIconIconNameKey: anyIconName,
                                     MTFontIconIconCodeKey: anyIconCode};
        NSString *anyIconName1 = @"another-icon";
        NSString *anyIconCode1 = @"\ue001";
        NSDictionary *anIconDict1 = @{MTFontIconIconNameKey: anyIconName1,
                                      MTFontIconIconCodeKey: anyIconCode1};
        NSArray *settings = @[anIconDict, anIconDict1];
        
        NSDictionary *iconsDictionary = [MTFontIconParser parseFontIconsFromArray:settings];
        
        [[theValue([iconsDictionary count]) should] equal:theValue([settings count])];
        
        [[iconsDictionary[anyIconName] should] equal:anyIconCode];
        [[iconsDictionary[anyIconName1] should] equal:anyIconCode1];
    });
    
});

SPEC_END