//
//  NSString+Unicode.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "NSString+Unicode.h"

@implementation NSString (Unicode)

+ (NSString *)stringWithUnicodeDecimalValue:(NSUInteger)value
{
    return [NSString stringWithFormat:@"%C", (unichar)value];
}

- (NSUInteger)hexStringToInteger
{
    NSLog(@"self: %@", self);
    NSUInteger length = [self length];
    NSUInteger intValue = 0;
    for (int i = 0; i < length; i++) {
        char c = [self characterAtIndex:i];
        int number = (int)c;
        int realNumber = 0;
        NSUInteger numericShift = 48;
        NSUInteger charShift = 97;
        if (number >= numericShift && number <= numericShift + 9) {
            realNumber = number - numericShift;
        }
        else if (number >= charShift && number <= charShift + 4) {
            realNumber = 10 + number - charShift;
        }
        intValue += pow(16, length - 1 - i) * realNumber;
    }
    return intValue;
}

@end
