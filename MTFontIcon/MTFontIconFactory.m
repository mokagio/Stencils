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
#import "NSString+Unicode.h"
#import <CoreText/CoreText.h>

static const CGFloat kWorkaroundOffset = -1;
static const CGFloat kWorkaroundScale = .95;

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
    MTFontIconModel *model = self.icons[icon];
    NSString *charForIcon = model.code;
    return charForIcon;
}

- (NSString *)fontNameForIcon:(NSString *)icon
{
    MTFontIconModel *model = self.icons[icon];
    NSString *fontName = model.fontName;
    return fontName;
}

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side
{
    NSString *fontName = [self fontNameForIcon:iconName];
    NSString *hexString = [self charForIcon:iconName];
    NSString *iconString = [NSString stringWithUnicodeDecimalValue:[hexString hexStringToInteger]];
 
    // TODO fix font name
    return [[MTFontIconView alloc] initWithFrame:CGRectMake(0, 0, side, side)
                                        fontName:fontName
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

        CGFloat size = self.frame.size.height * kWorkaroundScale;
        UIFont *font = [UIFont fontWithName:fontName size:size];
        if (!font) {
            NSURL *url = [[NSBundle mainBundle] URLForResource:fontName withExtension:@"ttf"];
            // Awesome snippet!
            //http://www.marco.org/2012/12/21/ios-dynamic-font-loading
            NSData *fontData = [NSData dataWithContentsOfURL:url];
            if (fontData) {
                CFErrorRef error;
                CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
                CGFontRef font = CGFontCreateWithDataProvider(provider);
                if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
                    CFStringRef errorDescription = CFErrorCopyDescription(error);
                    NSLog(@"Failed to load font: %@", errorDescription);
                    CFRelease(errorDescription);
                }
                CFRelease(font);
                CFRelease(provider);
            }
            font = [UIFont fontWithName:fontName size:size];
        }
        
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.label.frame = CGRectMake(0,
                                  kWorkaroundOffset,
                                  self.frame.size.width,
                                  self.frame.size.height);
    self.label.font = [UIFont fontWithName:self.label.font.fontName
                                      size:self.frame.size.height * kWorkaroundScale];
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