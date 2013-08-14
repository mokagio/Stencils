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
@end

@interface MTFontIconFactory : NSObject

- (NSString *)charForIcon:(NSString *)icon;
- (UIFont *)iconFontOfSize:(CGFloat)size;

- (MTFontIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side;

@end
