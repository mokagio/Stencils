//
//  STIconParser.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>
#import "STIconModel.h"

@interface STParser : NSObject

/**
 *  Parse a dictionary containing the configurations for a set of icon returning an dictionary
 *  which keys are the icons names, and the values instances of `STIconModel`
 *
 *  @param dictionary The raw configurations dictionary
 *
 *  @return A dictionary with icon nmaes as keys and `STIconModel` as values
 */
+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary;

@end

///----------------
/// @name Constants
///----------------

extern NSString * const STIconParserFontKey;

extern NSString * const MTFontIconIconsKey;
extern NSString * const MTFontIconIconNameKey;
extern NSString * const MTFontIconIconCodeKey;
extern NSString * const MTFontIconBaselineAdjustementKey;
extern NSString * const MTFontIconScaleAdjustementKey;
