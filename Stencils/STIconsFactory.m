//
//  MTFontIconFactory.m
//
//  Copyright (c) 2014 Giovanni Lodi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "STIconsFactory.h"
#import "STIconModel.h"
#import "STParser.h"

static NSString *kDefaultConfigurationName = @"Stencils";

@interface STIconsFactory ()
@property (nonatomic, strong) NSDictionary *icons;
@property (nonatomic, strong) UIFont *font;
@end

@implementation STIconsFactory

#pragma mark - Init

- (id)initWithConfigurationNamed:(NSString *)configurationName
{
    self = [super init];
    if (!self) return nil;

    [self setupIconsWithConfigurationNamed:configurationName];

    return self;
}

- (id)init
{
    return [self initWithConfigurationNamed:kDefaultConfigurationName];
}

#pragma mark - Icons setup

- (void)setupIconsWithConfigurationNamed:(NSString *)configurationName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:configurationName ofType:@"plist"];
    NSDictionary *settingsDictionary = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    } else {
        NSLog(@"ERROR! Cannot find Stencils configuration file at path %@", filePath);
        // Throw an exception?
    }
    self.icons = [STParser parseFontIconsFromDictionary:settingsDictionary];
}

#pragma mark - Icon views generation

- (STIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side
{
    STIconModel *model = self.icons[iconName];
    STIconView *iconView = [[STIconView alloc] initWithFrame:CGRectMake(0, 0, side, side)
                                                               model:model];
    return iconView;
}

@end
