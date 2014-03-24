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
extern NSString *MTFontIconBaselineAdjustementKey;
extern NSString *MTFontIconScaleAdjustementKey;

@interface MTFontIconParser : NSObject

+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary;

@end
