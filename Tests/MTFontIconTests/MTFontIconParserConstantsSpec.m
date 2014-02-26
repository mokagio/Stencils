//
//  MTFontIconParserConstantsSpec.m
//  Tests
//
//  Created by Gio on 14/08/2013.
//
//

#import <Kiwi.h>
#import "MTFontIconParser.h"

SPEC_BEGIN(MTFontIconParserConstantsSpec)

describe(@"MTFontIconParser Constants", ^{
    
    it(@"should have the font icons key equal to 'font-icons'", ^{
        [[MTFontIconIconsKey should] equal:@"font-icons"];
    });

    it(@"should have the font name key equal to 'font-name'", ^{
        [[MTFontIconParserFontKey should] equal:@"font-name"];
    });
    
    it(@"should have the icon name key equal to 'icon-name'", ^{
        [[MTFontIconIconNameKey should] equal:@"icon-name"];
    });
    
    it(@"should have the icon code key equal to 'icon-code'", ^{
        [[MTFontIconIconCodeKey should] equal:@"icon-code"];
    });
    
    it(@"should have the icon padding left key equal to 'padding-left'", ^{
        [[MTFontIconPaddingLeftKey should] equal:@"padding-left"];
    });
    
    it(@"should have the icon padding left key equal to 'padding-top'", ^{
        [[MTFontIconPaddingTopKey should] equal:@"padding-top"];
    });
});

SPEC_END