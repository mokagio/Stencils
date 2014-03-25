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