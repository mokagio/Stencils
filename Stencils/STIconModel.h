//
//  STIconModel.h
//  
//
//  Created by Gio on 22/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface STIconModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *fontName;

/**
 *  Optional adjustement value to compensate an eventual vertical offset of the custom font from 
 *  the baseline.
 *  This value is multiplied with the requested height of the icon to get the actual size the icon
 *  should have to avoid croppings.
 *  Usually used in combination with `scaleAdjustement`.
 *
 *  Default is 1.
 *
 *  Tip: try values > 1.
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
 *  Tip: since using a `baselineAdjustement` will make the icon bigger, use values < 1.
 *
 *  @see baselineAdjustement
 */
@property (nonatomic, assign) CGFloat scaleAdjustement;

@end
