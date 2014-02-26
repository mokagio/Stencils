//
//  MTFontIconModel.h
//  
//
//  Created by Gio on 22/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface MTFontIconModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *fontName;

/**
 *  Padding the actual font icon should have from the left the view bounds.
 *  Use it to handle those cases where the font is not rendered as expected because of the values of
 *  ascender or descender.
 *
 *  Default is 0
 */
@property (nonatomic, assign) CGFloat paddingLeft;

/**
 *  Padding the actual font icon should have from the top the view bounds.
 *  Use it to handle those cases where the font is not rendered as expected because of the values of
 *  ascender or descender.
 *
 *  Default is 0
 */
@property (nonatomic, assign) CGFloat paddingTop;

@end
