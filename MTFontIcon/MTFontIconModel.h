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
 *  Optional adjustement value to compensate an eventual offset of the custom font from the baseline.
 *  This value is multiplied with the requested size of the icon to get the actual size the icon
 *  should have to avoid croppings.
 *  Usually used in combination with `scaleAdjustement`.
 *
 *  Default is 1.
 *
 *  @see scaleAdjustement
 */
@property (nonatomic, assign) CGFloat baselineAdjustement;

/**
 *  Optional scale factor for the view. Usually used in combination with `baselineAdjustement` to
 *  compensate an eventual offset of the custom font from the baseline.
 *
 *  Default is 1.
 *
 *  @see baselineAdjustement
 */
@property (nonatomic, assign) CGFloat scaleAdjustement;

@end
