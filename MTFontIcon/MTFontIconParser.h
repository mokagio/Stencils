//
//  MTFontIconParser.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>
#import "MTFontIconModel.h"

extern NSString *MTFontIconParserFontKey;
extern NSString *MTFontIconIconsKey;
extern NSString *MTFontIconIconNameKey;
extern NSString *MTFontIconIconCodeKey;
extern NSString *MTFontIconPaddingLeftKey;
extern NSString *MTFontIconPaddingTopKey;

@interface MTFontIconParser : NSObject

+ (NSDictionary *)parseFontIcons;

// Better in an Internals/Private category
+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array;

@end
