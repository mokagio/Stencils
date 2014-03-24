//
//  MTFontIconParser.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "MTFontIconParser.h"
#import "MTFontIconModel.h"

NSString * const MTFontIconIconsKey = @"font-icons";

NSString * const MTFontIconParserFontKey = @"font-name";
NSString * const MTFontIconIconNameKey = @"icon-name";
NSString * const MTFontIconIconCodeKey = @"icon-code";
NSString * const MTFontIconBaselineAdjustementKey = @"baseline-adjustement";
NSString * const MTFontIconScaleAdjustementKey = @"scale-adjustement";

@implementation MTFontIconParser

+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary
{
    return [self parseFontIconsFromArray:dictionary[MTFontIconIconsKey]];
}

+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array
{
    NSMutableDictionary *iconsDict = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dataDict, NSUInteger idx, BOOL *stop) {
        MTFontIconModel *model = [[MTFontIconModel alloc] init];
        NSString *name = dataDict[MTFontIconIconNameKey];
        model.name = name;
        model.code = dataDict[MTFontIconIconCodeKey];
        model.fontName = dataDict[MTFontIconParserFontKey];
        if (dataDict[MTFontIconBaselineAdjustementKey]) {
            model.baselineAdjustement = [dataDict[MTFontIconBaselineAdjustementKey] floatValue];
        }
        if (dataDict[MTFontIconScaleAdjustementKey]) {
            model.scaleAdjustement = [dataDict[MTFontIconScaleAdjustementKey] floatValue];
        }
        iconsDict[name] = model;
    }];
    return [NSDictionary dictionaryWithDictionary:iconsDict];
}

@end
