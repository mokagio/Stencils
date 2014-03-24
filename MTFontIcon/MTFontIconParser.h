//
//  MTFontIconParser.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>
#import "MTFontIconModel.h"

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

///----------------
/// @name Constants
///----------------

extern NSString * const MTFontIconParserFontKey;

extern NSString * const MTFontIconIconsKey;
extern NSString * const MTFontIconIconNameKey;
extern NSString * const MTFontIconIconCodeKey;
extern NSString * const MTFontIconBaselineAdjustementKey;
extern NSString * const MTFontIconScaleAdjustementKey;
