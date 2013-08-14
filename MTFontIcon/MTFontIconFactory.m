//
//  MTFontIconFactory.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "MTFontIconFactory.h"
#import "MTFontIconParser.h"
#import "NSString+Unicode.h"

@interface MTFontIconFactory ()
@property (nonatomic, strong) NSDictionary *icons;
@property (nonatomic, strong) UIFont *font;
@end


@implementation MTFontIconFactory

- (id)init
{
    self = [super init];
    if (self) {
        [self setupIcons];
    }
    return self;
}

- (void)setupIcons
{
    self.icons = [MTFontIconParser parseFontIcons];
}

- (NSString *)charForIcon:(NSString *)icon
{
    return self.icons[icon];
}

- (UIFont *)iconFontOfSize:(CGFloat)size
{
    // TODO - fix the fontname!
    return [UIFont fontWithName:@"icomoon" size:size];
}

- (UIView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side
{
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, side, side)];
    view.backgroundColor = [UIColor clearColor];
    view.textAlignment = NSTextAlignmentCenter;
    view.textColor = [UIColor whiteColor];
    view.font = [self iconFontOfSize:side];
    NSString *hexString = [self charForIcon:iconName];
    view.text = [NSString stringWithUnicodeDecimalValue:[hexString hexStringToInteger]];
    
    return view;
}

@end
