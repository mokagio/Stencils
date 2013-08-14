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

static const CGFloat kWorkaroundOffset = -1;
static const CGFloat kWorkaroundScale = .95;


@interface MTFontIconView ()
- (id)initWithFrame:(CGRect)frame fontName:(NSString *)fontName iconString:(NSString *)iconString;
@end


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

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side
{
    NSString *hexString = [self charForIcon:iconName];
    NSString *iconString = [NSString stringWithUnicodeDecimalValue:[hexString hexStringToInteger]];
 
    // TODO fix font name
    return [[MTFontIconView alloc] initWithFrame:CGRectMake(0, 0, side, side)
                                        fontName:@"icomoon"
                                      iconString:iconString];
}

@end


@implementation MTFontIconView

- (id)initWithFrame:(CGRect)frame fontName:(NSString *)fontName iconString:(NSString *)iconString
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat side = frame.size.width;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                   kWorkaroundOffset,
                                                                   side,
                                                                   side)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:fontName size:self.frame.size.height * kWorkaroundScale];
        label.text = iconString;
        
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self addSubview:label];
    }
    return self;
}

@end