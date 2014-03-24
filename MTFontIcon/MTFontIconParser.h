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

/**
 *  Parse a dictionary containing the configurations for a set of icon returning an dictionary
 *  which keys are the icons names, and the values instances of `MTFontIconModel`
 *
 *  @param dictionary The raw configurations dictionary
 *
 *  @return A dictionary with icon nmaes as keys and `MTFontIconModel` as values
 */
+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary;

@end
