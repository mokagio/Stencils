//
//  MTFontIconFactory.m
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import "MTFontIconFactory.h"
#import "MTFontIconParser.h"


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

@end
