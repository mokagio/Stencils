//
//  MTFontIconView.m
//  Pods
//
//  Created by Gio on 18/03/2014.
//
//

#import "MTFontIconView.h"
#import "MTFontIconModel.h"
#import "NSString+Unicode.h"
#import <CoreText/CoreText.h>

@interface MTFontIconView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) MTFontIconModel *model;
@end

@implementation MTFontIconView

- (id)initWithFrame:(CGRect)frame model:(MTFontIconModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        self.model = model;
        
        self.baselineAdjustement = model.baselineAdjustement;
        self.scaleAdjustement = model.scaleAdjustement;
        
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
    
    self.label.frame = CGRectMake(0,
                                  - (self.frame.size.height * self.baselineAdjustement - self.frame.size.height),
                                  self.frame.size.width,
                                  self.frame.size.height * self.baselineAdjustement);
    self.label.transform = CGAffineTransformMakeScale(self.scaleAdjustement, self.scaleAdjustement);
    self.label.font = [UIFont fontWithName:self.label.font.fontName
                                      size:self.frame.size.height];
    
    if (self.color) {
        self.label.textColor = self.color;
    } else {
        self.label.textColor = self.tintColor;
    }
}

#pragma mark - Properties Setters

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.label.textColor = _color;
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

#pragma mark - Tint Color

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

@end
