//
//  MTViewController.m
//  Example
//
//  Created by Gio on 14/08/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "MTViewController.h"

#import "MTFontIconFactory.h"


static NSUInteger kNumberOfIcons = 7;
static CGFloat kPadding = 30;
static CGFloat kMinSide = 40;
static CGFloat kMaxSide = 80;


@interface MTViewController ()
@property (nonatomic, strong) NSMutableArray *icons;
@end


@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.icons = [NSMutableArray arrayWithCapacity:kNumberOfIcons];
    for (int i = 0; i < kNumberOfIcons; i++) {
        CGRect frame = CGRectZero;
        do {
            frame.size = [self randomSize];
            frame.origin = [self randomOriginWithSize:frame.size];
        } while ([self isFrameIntersecting:frame]);
        
        UIView *icon = [[UIView alloc] initWithFrame:frame];
        icon.backgroundColor = [UIColor whiteColor];

        [self.icons addObject:icon];
        [self.view addSubview:icon];
    }
    
}

- (CGPoint)randomOriginWithSize:(CGSize)size
{
    CGFloat x = 0;
    do {
        x = arc4random() % (int)(self.view.frame.size.width - 2 * kPadding) + kPadding;
    } while (x + size.width > self.view.frame.size.width - kPadding);
    
    CGFloat y = 0;
    do {
        y = arc4random() % (int)(self.view.frame.size.height - 2 * kPadding) + kPadding;
    } while (y + size.height > self.view.frame.size.height - kPadding);
    
    return CGPointMake(x, y);
}

- (CGSize)randomSize
{
    CGFloat side = arc4random() % (int)(kMaxSide - kMinSide) + kMinSide;
    return CGSizeMake(side, side);
}

- (BOOL)isFrameIntersecting:(CGRect)frame
{
    __block BOOL intersects = NO;
    [self.icons enumerateObjectsUsingBlock:^(UIView *icon, NSUInteger idx, BOOL *stop) {
        if (CGRectIntersectsRect(icon.frame, frame)) {
            intersects = YES;
            *stop = YES;
        };
    }];
    return intersects;
}

@end
