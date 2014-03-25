//
//  STIconParser.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "STParser.h"
#import "STIconModel.h"

NSString * const STIconParserIconsKey = @"font-icons";

NSString * const STIconParserFontKey = @"font-name";
NSString * const STIconParserIconNameKey = @"icon-name";
NSString * const STIconParserIconCodeKey = @"icon-code";
NSString * const STIconParserBaselineAdjustementKey = @"baseline-adjustement";
NSString * const STIconParserScaleAdjustementKey = @"scale-adjustement";

@implementation STParser

+ (NSDictionary *)parseFontIconsFromDictionary:(NSDictionary *)dictionary
{
    return [self parseFontIconsFromArray:dictionary[STIconParserIconsKey]];
}

+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array
{
    NSMutableDictionary *iconsDict = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dataDict, NSUInteger idx, BOOL *stop) {
        STIconModel *model = [[STIconModel alloc] init];
        NSString *name = dataDict[STIconParserIconNameKey];
        model.name = name;
        model.code = dataDict[STIconParserIconCodeKey];
        model.fontName = dataDict[STIconParserFontKey];
        if (dataDict[STIconParserBaselineAdjustementKey]) {
            model.baselineAdjustement = [dataDict[STIconParserBaselineAdjustementKey] floatValue];
        }
        if (dataDict[STIconParserScaleAdjustementKey]) {
            model.scaleAdjustement = [dataDict[STIconParserScaleAdjustementKey] floatValue];
        }
        iconsDict[name] = model;
    }];
    return [NSDictionary dictionaryWithDictionary:iconsDict];
}

@end
