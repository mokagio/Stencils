//
//  MTFontIconFactory.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "MTFontIconFactory.h"
#import "MTFontIconModel.h"
#import "MTFontIconParser.h"
#import "MTFontIconView.h"

static NSString *kDefaultConfigurationName = @"MTFontIcon";

@interface MTFontIconFactory ()
@property (nonatomic, strong) NSDictionary *icons;
@property (nonatomic, strong) UIFont *font;
@end


@implementation MTFontIconFactory

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
        // Throw an exception?
    }
    self.icons = [MTFontIconParser parseFontIconsFromDictionary:settingsDictionary];
}

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side
{
    MTFontIconModel *model = self.icons[iconName];
    MTFontIconView *iconView = [[MTFontIconView alloc] initWithFrame:CGRectMake(0, 0, side, side)
                                                               model:model];
    return iconView;
}

@end
