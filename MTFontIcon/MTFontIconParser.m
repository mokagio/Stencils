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

static NSString *kFileName = @"MTFontIcon";
static NSString *kFileExtension = @"plist";

@implementation MTFontIconParser

+ (NSDictionary *)parseFontIcons
{
    return [self parseFontIconsFromArray:[self settingsArrayFromDefaultFile]];
}

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

+ (NSArray *)settingsArrayFromDefaultFile
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:kFileName ofType:kFileExtension];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        return settingsDict[MTFontIconIconsKey];
    } else {
        // Throw an exception?
        return nil;
    }
}

@end
