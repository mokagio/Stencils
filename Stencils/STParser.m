//
//  STIconParser.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "STParser.h"
#import "STIconModel.h"

NSString * const MTFontIconIconsKey = @"font-icons";

NSString * const STIconParserFontKey = @"font-name";
NSString * const MTFontIconIconNameKey = @"icon-name";
NSString * const MTFontIconIconCodeKey = @"icon-code";
NSString * const MTFontIconBaselineAdjustementKey = @"baseline-adjustement";
NSString * const MTFontIconScaleAdjustementKey = @"scale-adjustement";

@implementation STParser

+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary
{
    return [self parseFontIconsFromArray:dictionary[MTFontIconIconsKey]];
}

+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array
{
    NSMutableDictionary *iconsDict = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dataDict, NSUInteger idx, BOOL *stop) {
        STIconModel *model = [[STIconModel alloc] init];
        NSString *name = dataDict[MTFontIconIconNameKey];
        model.name = name;
        model.code = dataDict[MTFontIconIconCodeKey];
        model.fontName = dataDict[STIconParserFontKey];
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
