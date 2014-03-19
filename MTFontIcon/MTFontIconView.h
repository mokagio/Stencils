//
//  MTFontIconView.h
//  Pods
//
//  Created by Gio on 18/03/2014.
//
//

#import <UIKit/UIKit.h>

@class MTFontIconModel;

@interface MTFontIconView : UIView

// If no color is provided falls back to the view tintColor
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;

@property (nonatomic, assign) CGFloat baselineAdjustement;
@property (nonatomic, assign) CGFloat scaleAdjustement;

@property (nonatomic, assign) CGFloat proportionalOffsetTop;

- (id)initWithFrame:(CGRect)frame model:(MTFontIconModel *)model;

@end
