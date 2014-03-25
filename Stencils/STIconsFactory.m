//
//  MTFontIconFactory.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "STIconsFactory.h"
#import "STIconModel.h"
#import "STParser.h"
#import "STIconView.h"

static NSString *kDefaultConfigurationName = @"MTFontIcon";

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
        NSLog(@"ERROR! Cannot find MTFontIcon configuration file at path %@", filePath);
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
