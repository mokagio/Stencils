//
//  MTFontIconFactory.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>

// TODO maybe move in it's own file?
@interface MTFontIconView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@end

@interface MTFontIconFactory : NSObject

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side;

@end
