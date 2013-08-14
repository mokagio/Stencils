//
//  NSString+Unicode.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Unicode)

+ (NSString *)stringWithUnicodeDecimalValue:(NSUInteger)value;

- (NSUInteger)hexStringToInteger;

@end
