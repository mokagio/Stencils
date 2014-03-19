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

@property (nonatomic, strong) UILabel *baselineAdjustementLabel;
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
    
    self.baselineAdjustementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              self.view.frame.size.width - 40 - self.baselineAdjustementStepper.frame.size.width,
                                                                              self.baselineAdjustementStepper.frame.size.height)];
    self.baselineAdjustementLabel.textColor = [UIColor whiteColor];
    self.baselineAdjustementLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.baselineAdjustementLabel];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.icon.center = self.view.center;
    self.frameView.center = self.view.center;
    
    CGRect baselineAdjustementLabelFrame = self.baselineAdjustementLabel.frame;
    baselineAdjustementLabelFrame.origin.y = CGRectGetMaxY(self.icon.frame) + 10;
    baselineAdjustementLabelFrame.origin.x = 20;
    self.baselineAdjustementLabel.frame = baselineAdjustementLabelFrame;
    
    CGRect baselineAdjustementStepperFrame = self.baselineAdjustementStepper.frame;
    baselineAdjustementStepperFrame.origin.y = self.baselineAdjustementLabel.frame.origin.y;
    baselineAdjustementStepperFrame.origin.x = CGRectGetMaxX(self.baselineAdjustementLabel.frame);
    self.baselineAdjustementStepper.frame = baselineAdjustementStepperFrame;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self reloadIcon];
}

#pragma mark - Font Icon

- (void)reloadIcon
{
    self.icon.baselineAdjustement = self.baselineAdjustementStepper.value;
    self.icon.scaleAdjustement = 1.0;
    self.icon.proportionalOffsetTop = 0;
    [self.icon setNeedsLayout];
    
    self.baselineAdjustementLabel.text = [NSString stringWithFormat:@"baseline adjustement: %.2f", self.baselineAdjustementStepper.value];
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
