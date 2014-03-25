//
//  NSStringPlusUnicodeSpec.m
//  Tests
//
//  Created by Gio on 17/09/2013.
//
//

#import <Kiwi.h>
#import <NSString+Unicode.h>

SPEC_BEGIN(NSStringPlusUnicodeSpec)

describe(@"NSString+Unicode Category", ^{
    it(@"converts properly the edge case x0000 to integer", ^{
        NSUInteger intValue = [@"0000" hexStringToInteger];
        [[theValue(intValue) should] equal:theValue(0)];
    });
    
    it(@"converts properly the edge case xffff to integer", ^{
        NSUInteger intValue = [@"ffff" hexStringToInteger];
        [[theValue(intValue) should] equal:theValue(65535)];
    });
    
    it(@"works with upper case strings as well", ^{
        NSArray *options = @[@"A", @"B", @"C", @"D", @"E", @"F"];
        NSUInteger idx = arc4random() % [options count];
        NSString *hex = options[idx];
        NSUInteger expected = 10 + idx;
        NSUInteger intValue = [hex hexStringToInteger];
        [[theValue(intValue) should] equal:theValue(expected)];
    });
});

SPEC_END
