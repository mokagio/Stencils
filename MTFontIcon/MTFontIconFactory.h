//
//  MTFontIconFactory.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>

@class MTFontIconView;

@interface MTFontIconFactory : NSObject

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side;

@end

// MTFontIconView is kept here with MTFontIconFactory because it's not intended to be used by itself.
@interface MTFontIconView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@end
