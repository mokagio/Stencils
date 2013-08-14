//
//  MTFontIconFactory.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>

@interface MTFontIconFactory : NSObject

- (NSString *)charForIcon:(NSString *)icon;
- (UIFont *)iconFontOfSize:(CGFloat)size;

- (UIView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side;

@end
