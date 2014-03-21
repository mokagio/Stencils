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

@property (nonatomic, strong) UILabel *scaleAdjustementLabel;
@property (nonatomic, strong) UIStepper *scaleAdjustementStepper;

@property (nonatomic, strong) UILabel *offsetTopLabel;
@property (nonatomic, strong) UIStepper *offsetTopStepper;

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
    self.baselineAdjustementStepper.stepValue = 0.01;
    [self.baselineAdjustementStepper addTarget:self action:@selector(reloadIcon) forControlEvents:UIControlEventValueChanged];
    self.baselineAdjustementStepper.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.baselineAdjustementStepper];
    
    self.baselineAdjustementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              self.view.frame.size.width - 40 - self.baselineAdjustementStepper.frame.size.width,
                                                                              self.baselineAdjustementStepper.frame.size.height)];
    self.baselineAdjustementLabel.textColor = [UIColor whiteColor];
    self.baselineAdjustementLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.baselineAdjustementLabel];
    
    self.scaleAdjustementStepper = [[UIStepper alloc] init];
    self.scaleAdjustementStepper.value = 1.0;
    self.scaleAdjustementStepper.stepValue = 0.01;
    [self.scaleAdjustementStepper addTarget:self action:@selector(reloadIcon) forControlEvents:UIControlEventValueChanged];
    self.scaleAdjustementStepper.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.scaleAdjustementStepper];
    
    self.scaleAdjustementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           self.view.frame.size.width - 40 - self.scaleAdjustementStepper.frame.size.width,
                                                                           self.scaleAdjustementStepper.frame.size.height)];
    self.scaleAdjustementLabel.textColor = [UIColor whiteColor];
    self.scaleAdjustementLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.scaleAdjustementLabel];
    
    self.offsetTopStepper = [[UIStepper alloc] init];
    self.offsetTopStepper.value = 0;
    self.offsetTopStepper.stepValue = 0.01;
    self.offsetTopStepper.minimumValue = -1;
    [self.offsetTopStepper addTarget:self action:@selector(reloadIcon) forControlEvents:UIControlEventValueChanged];
    self.offsetTopStepper.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.offsetTopStepper];
    
    self.offsetTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    self.view.frame.size.width - 40 - self.offsetTopStepper.frame.size.width,
                                                                    self.offsetTopStepper.frame.size.height)];
    self.offsetTopLabel.textColor = [UIColor whiteColor];
    self.offsetTopLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.offsetTopLabel];
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
    
    CGRect scaleAdjustementLabelFrame = self.scaleAdjustementLabel.frame;
    scaleAdjustementLabelFrame.origin.y = CGRectGetMaxY(self.baselineAdjustementLabel.frame) + 10;
    scaleAdjustementLabelFrame.origin.x = 20;
    self.scaleAdjustementLabel.frame = scaleAdjustementLabelFrame;
    
    CGRect scaleAdjustementStepperFrame = self.scaleAdjustementStepper.frame;
    scaleAdjustementStepperFrame.origin.y = self.scaleAdjustementLabel.frame.origin.y;
    scaleAdjustementStepperFrame.origin.x = CGRectGetMaxX(self.scaleAdjustementLabel.frame);
    self.scaleAdjustementStepper.frame = scaleAdjustementStepperFrame;
    
    CGRect offsetTopLabelFrame = self.offsetTopLabel.frame;
    offsetTopLabelFrame.origin.y = CGRectGetMaxY(self.scaleAdjustementLabel.frame) + 10;
    offsetTopLabelFrame.origin.x = 20;
    self.offsetTopLabel.frame = offsetTopLabelFrame;
    
    CGRect offsetTopStepperFrame = self.offsetTopStepper.frame;
    offsetTopStepperFrame.origin.y = self.offsetTopLabel.frame.origin.y;
    offsetTopStepperFrame.origin.x = CGRectGetMaxX(self.offsetTopLabel.frame);
    self.offsetTopStepper.frame = offsetTopStepperFrame;
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
    self.icon.scaleAdjustement = self.scaleAdjustementStepper.value;;
    self.icon.proportionalOffsetTop = self.offsetTopStepper.value;
    [self.icon setNeedsLayout];
    
    self.baselineAdjustementLabel.text = [NSString stringWithFormat:@"baseline adjustement: %.2f", self.baselineAdjustementStepper.value];
    self.scaleAdjustementLabel.text = [NSString stringWithFormat:@"scale adjustement: %.2f", self.scaleAdjustementStepper.value];
    self.offsetTopLabel.text = [NSString stringWithFormat:@"proportional offset top: %.2f", self.offsetTopStepper.value];
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
