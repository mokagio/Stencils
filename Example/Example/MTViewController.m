//
//  MTViewController.m
//  Example
//
//  Created by Gio on 14/08/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "MTViewController.h"
#import "MTFontIconFactory.h"
#import "NSString+Unicode.h"

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
    
    MTFontIconFactory *iconFactory = [[MTFontIconFactory alloc] init];
    NSArray *names = @[@"apple", @"pacman", @"bug", @"smile"];
    
    self.icons = [NSMutableArray arrayWithCapacity:kNumberOfIcons];
    for (int i = 0; i < kNumberOfIcons; i++) {
        CGFloat side = [self randomSide];
        MTFontIconView *iconView = [iconFactory iconViewForIconNamed:names[arc4random() % [names count]]
                                                            withSide:side];
        CGPoint center = CGPointZero;
        do {
            center = [self randomCenterWithSide:side];
            iconView.center = center;
        } while ([self isFrameIntersecting:iconView.frame]);
        
        iconView.color = [UIColor yellowColor];
        iconView.shadowColor = [UIColor orangeColor];
        iconView.shadowOffset = CGSizeMake(1, 1);
        
        [self.icons addObject:iconView];
        [self.view addSubview:iconView];
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

- (CGPoint)randomCenterWithSide:(CGFloat)side
{
    CGFloat x = 0;
    do {
        x = arc4random() % (int)(self.view.frame.size.width - 2 * kPadding - side) + kPadding + side / 2;
    } while (x + side / 2 > self.view.frame.size.width - kPadding);
    
    CGFloat y = 0;
    do {
        y = arc4random() % (int)(self.view.frame.size.height - 2 * kPadding - side) + kPadding + side / 2;
    } while (y + side / 2 > self.view.frame.size.height - kPadding);
    
    return CGPointMake(x, y);
}

- (CGFloat)randomSide
{
    CGFloat side = arc4random() % (int)(kMaxSide - kMinSide) + kMinSide;
    return side;
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