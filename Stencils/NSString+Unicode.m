//
//  NSString+Unicode.m
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
