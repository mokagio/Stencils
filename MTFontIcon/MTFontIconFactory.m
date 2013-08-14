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

static NSString * const kFontName = @"icomoon";


@interface MTFontIconView ()
@property (nonatomic, strong) UILabel *label;
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
                                        fontName:kFontName
                                      iconString:iconString];
}

@end


@implementation MTFontIconView

- (id)initWithFrame:(CGRect)frame fontName:(NSString *)fontName iconString:(NSString *)iconString
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat side = frame.size.width;
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               kWorkaroundOffset,
                                                               side,
                                                               side)];
        
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.numberOfLines = 0;
        self.label.lineBreakMode = NSLineBreakByWordWrapping;

        self.label.font = [UIFont fontWithName:fontName size:self.frame.size.height * kWorkaroundScale];
        self.label.text = iconString;
        
        self.label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.label];
        
        self.color = [UIColor whiteColor];
        self.shadowOffset = CGSizeMake(0, 0);
        self.shadowColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - Properties Overrides

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.label.textColor = color;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
    _shadowColor = shadowColor;
    self.label.shadowColor = shadowColor;
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    self.label.shadowOffset = shadowOffset;
}

@end