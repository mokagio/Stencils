//
//  MTFontIconFactory.h
//  
//
//  Created by Gio on 14/08/2013.
//
//

#import <Foundation/Foundation.h>

@class STIconView;

@interface STIconsFactory : NSObject

/**
 *  Get a `STIconView` with icon with the given name of the given side.
 *
 *  @param iconName The name of the icon to display in the view
 *  @param side     The side of the view, the value that both widht and height will have
 *
 *  @return The newly created icon view with the requested icon, of the given side
 */
- (STIconView *)iconViewForIconNamed:(NSString *)iconName withSide:(CGFloat)side;

@end
