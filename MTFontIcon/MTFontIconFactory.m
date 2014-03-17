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

@interface MTFontIconView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) MTFontIconModel *model;

- (id)initWithFrame:(CGRect)frame model:(MTFontIconModel *)model;

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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MTFontIcon" ofType:@"plist"];
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


@implementation MTFontIconView

- (id)initWithFrame:(CGRect)frame model:(MTFontIconModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        self.model = model;
        
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.numberOfLines = 0;
        self.label.lineBreakMode = NSLineBreakByWordWrapping;

        UIFont *font = [UIFont fontWithName:model.fontName size:1];
        if (!font) {
            NSURL *url = [[NSBundle mainBundle] URLForResource:model.fontName withExtension:@"ttf"];
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
            font = [UIFont fontWithName:model.fontName size:1];
        }
        self.label.font = font;

        NSString *iconString = [NSString stringWithUnicodeDecimalValue:[self.model.code hexStringToInteger]];
        self.label.text = iconString;
        
        self.label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.label];
        
        self.color = nil;
        self.shadowOffset = CGSizeMake(0, 0);
        self.shadowColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat scaleAdjustement = self.model.scaleAdjustement;
    self.label.frame = CGRectMake(0,
                                  - (self.frame.size.height * self.model.baselineAdjustement - self.frame.size.height),
                                  self.frame.size.width,
                                  self.frame.size.height * self.model.baselineAdjustement);
    self.label.transform = CGAffineTransformMakeScale(scaleAdjustement, scaleAdjustement);
    self.label.font = [UIFont fontWithName:self.label.font.fontName
                                      size:self.frame.size.height];
    
    if (self.color) {
        self.label.textColor = self.color;
    } else {
        self.label.textColor = self.tintColor;
    }
}

#pragma mark - Properties Overrides

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.label.textColor = _color;
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
 
    if (!self.color) { self.label.textColor = tintColor; }
}

- (void)tintColorDidChange
{
    [super tintColorDidChange];
    self.label.textColor = self.tintColor;
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