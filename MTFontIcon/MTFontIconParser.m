//
//  MTFontIconParser.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "MTFontIconParser.h"

NSString *MTFontIconParserFontKey = @"font-name";
NSString *MTFontIconIconsKey = @"font-icons";
NSString *MTFontIconIconNameKey = @"icon-name";
NSString *MTFontIconIconCodeKey = @"icon-code";

@implementation MTFontIconParser

+ (NSDictionary *)parseFontIconsFromArray:(NSArray *)array
{
    NSMutableDictionary *iconsDict = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dataDict, NSUInteger idx, BOOL *stop) {
        NSString *name = dataDict[MTFontIconIconNameKey];
        NSString *code = dataDict[MTFontIconIconCodeKey];
        [iconsDict setValue:code forKey:name];
    }];
    return [NSDictionary dictionaryWithDictionary:iconsDict];
}

@end
