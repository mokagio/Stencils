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
