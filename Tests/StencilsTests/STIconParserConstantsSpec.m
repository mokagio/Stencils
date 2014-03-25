//
//  STIconParserConstantsSpec.m
//  Tests
//
//  Created by Gio on 14/08/2013.
//
//

#import <Kiwi.h>
#import "STParser.h"

SPEC_BEGIN(STIconParserConstantsSpec)

describe(@"STIconParser Constants", ^{
    
    it(@"should have the font icons key equal to 'font-icons'", ^{
        [[STIconParserIconsKey should] equal:@"font-icons"];
    });

    it(@"should have the font name key equal to 'font-name'", ^{
        [[STIconParserFontKey should] equal:@"font-name"];
    });
    
    it(@"should have the icon name key equal to 'icon-name'", ^{
        [[STIconParserIconNameKey should] equal:@"icon-name"];
    });
    
    it(@"should have the icon code key equal to 'icon-code'", ^{
        [[STIconParserIconCodeKey should] equal:@"icon-code"];
    });
    
    it(@"should have the icon padding left key equal to 'baseline-adjustement'", ^{
        [[STIconParserBaselineAdjustementKey should] equal:@"baseline-adjustement"];
    });
    
    it(@"should have the icon padding left key equal to 'scale-adjustement'", ^{
        [[STIconParserScaleAdjustementKey should] equal:@"scale-adjustement"];
    });
});

SPEC_END