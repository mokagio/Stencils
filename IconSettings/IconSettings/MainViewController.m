//
//  MainViewController.m
//  IconSettings
//
//  Created by Gio on 18/03/2014.
//
//

#import "MainViewController.h"

#import <MTFontIconFactory.h>
#import <MTFontIconView.h>

@interface MainViewController ()
@property (nonatomic, strong) MTFontIconView *icon;
@property (nonatomic, strong) UIView *frameView;

@property (nonatomic, strong) UIStepper *baselineAdjustementStepper;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    MTFontIconFactory *factory = [[MTFontIconFactory alloc] init];
    self.icon = [factory iconViewForIconNamed:@"pacman" withSide:100];
    self.icon.color = [UIColor whiteColor];
    [self.view addSubview:self.icon];
    
    self.frameView = [[UIView alloc] initWithFrame:self.icon.frame];
    self.frameView.layer.borderColor = [UIColor grayColor].CGColor;
    self.frameView.layer.borderWidth = 1;
    [self.view addSubview:self.frameView];
    
    self.baselineAdjustementStepper = [[UIStepper alloc] init];
    self.baselineAdjustementStepper.value = 1.0;
    self.baselineAdjustementStepper.stepValue = 0.05;
    [self.baselineAdjustementStepper addTarget:self action:@selector(reloadIcon) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.baselineAdjustementStepper];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.icon.center = self.view.center;
    self.frameView.center = self.view.center;
    
    self.baselineAdjustementStepper.center = self.view.center;
    CGRect baselineAdjustementStepperFrame = self.baselineAdjustementStepper.frame;
    baselineAdjustementStepperFrame.origin.y = CGRectGetMaxY(self.icon.frame) + 10;
    self.baselineAdjustementStepper.frame = baselineAdjustementStepperFrame;
}

#pragma mark - Font Icon

- (void)reloadIcon
{
    self.icon.baselineAdjustement = self.baselineAdjustementStepper.value;
    self.icon.scaleAdjustement = 1.0;
    self.icon.proportionalOffsetTop = 0;
    [self.icon setNeedsLayout];
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
