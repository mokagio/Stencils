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
#import <STIconModel.h>

SPEC_BEGIN(STIconModelSpec)

describe(@"STIconModel", ^{
    it(@"should init with a paddingLeft of 1", ^{
        STIconModel *model = [[STIconModel alloc] init];
        [[theValue(model.baselineAdjustement) should] equal:theValue(1)];
    });
    
    it(@"should init with a paddingTop of 1", ^{
        STIconModel *model = [[STIconModel alloc] init];
        [[theValue(model.scaleAdjustement) should] equal:theValue(1)];
    });
});

SPEC_END