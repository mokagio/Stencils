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
    NSUInteger length = [self length];
    NSUInteger intValue = 0;
    for (int i = 0; i < length; i++) {
        char c = [[self lowercaseString] characterAtIndex:i];
        NSUInteger number = (NSUInteger)c;
        NSUInteger realNumber = 0;
        NSUInteger numericShift = 48;
        NSUInteger charShift = 97;
        
        BOOL isDigit = number >= numericShift && number <= (numericShift + 9);
        // Allowed chars = a...f
        // => 5 positions
        BOOL isAllowedChar = number >= charShift && number <= (charShift + 5);
        
        if (isDigit) {
            realNumber = number - numericShift;
        }
        else if (isAllowedChar) {
            realNumber = 10 + number - charShift;
        }
        intValue += pow(16, length - 1 - i) * realNumber;
    }
    return intValue;
}

@end
