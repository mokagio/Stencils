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

@interface MainViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSMutableArray *iconsData;
@property (nonatomic, assign) NSUInteger currentIconIndex;

@property (nonatomic, strong) MTFontIconView *icon;
@property (nonatomic, strong) UIView *frameView;

@property (nonatomic, strong) UILabel *baselineAdjustementLabel;
@property (nonatomic, strong) UIStepper *baselineAdjustementStepper;

@property (nonatomic, strong) UILabel *scaleAdjustementLabel;
@property (nonatomic, strong) UIStepper *scaleAdjustementStepper;

@property (nonatomic, strong) UILabel *offsetTopLabel;
@property (nonatomic, strong) UIStepper *offsetTopStepper;

@property (nonatomic, strong) UIPickerView *iconPicker;

@property (nonatomic, strong) UIButton *applyPreviousIconSettingsButton;

@end

@implementation MainViewController

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadIconsData];
        self.currentIconIndex = 0;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self loadCurrentIcon];
    
    self.frameView = [[UIView alloc] initWithFrame:self.icon.frame];
    self.frameView.layer.borderColor = [UIColor grayColor].CGColor;
    self.frameView.layer.borderWidth = 1;
    [self.view addSubview:self.frameView];
    
    self.baselineAdjustementStepper = [[UIStepper alloc] init];
    self.baselineAdjustementStepper.value = 1.0;
    self.baselineAdjustementStepper.stepValue = 0.01;
    [self.baselineAdjustementStepper addTarget:self action:@selector(reloadIconMetrics) forControlEvents:UIControlEventValueChanged];
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
    [self.scaleAdjustementStepper addTarget:self action:@selector(reloadIconMetrics) forControlEvents:UIControlEventValueChanged];
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
    [self.offsetTopStepper addTarget:self action:@selector(reloadIconMetrics) forControlEvents:UIControlEventValueChanged];
    self.offsetTopStepper.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.offsetTopStepper];
    
    self.offsetTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    self.view.frame.size.width - 40 - self.offsetTopStepper.frame.size.width,
                                                                    self.offsetTopStepper.frame.size.height)];
    self.offsetTopLabel.textColor = [UIColor whiteColor];
    self.offsetTopLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.offsetTopLabel];
    
    self.iconPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    self.iconPicker.dataSource = self;
    self.iconPicker.delegate = self;
    self.iconPicker.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.iconPicker];
    
    self.applyPreviousIconSettingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.applyPreviousIconSettingsButton.frame = CGRectMake(0, 0, 200, 40);
    [self.applyPreviousIconSettingsButton setTitle:@"apply previous icon metrics" forState:UIControlStateNormal];
    [self.applyPreviousIconSettingsButton addTarget:self action:@selector(applyPreviousIconSettings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.applyPreviousIconSettingsButton];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.icon.center = self.view.center;
    CGRect iconFrame = self.icon.frame;
    iconFrame.origin.y = 80;
    self.icon.frame = iconFrame;
    self.frameView.center = self.icon.center;
    
    CGRect baselineAdjustementLabelFrame = self.baselineAdjustementLabel.frame;
    baselineAdjustementLabelFrame.origin.y = CGRectGetMaxY(self.icon.frame) + 60;
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
    
    self.applyPreviousIconSettingsButton.center = self.view.center;
    CGRect buttonFrame = self.applyPreviousIconSettingsButton.frame;
    buttonFrame.origin.y = CGRectGetMaxY(self.offsetTopLabel.frame) + 10;
    self.applyPreviousIconSettingsButton.frame = buttonFrame;
    
    CGRect pickerFrame = self.iconPicker.frame;
    pickerFrame.origin.y = self.view.frame.size.height - pickerFrame.size.height;
    self.iconPicker.frame = pickerFrame;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self reloadIconMetrics];
}

#pragma mark - Font Icon

- (void)loadCurrentIcon
{
    [self.icon removeFromSuperview];
    
    MTFontIconFactory *factory = [[MTFontIconFactory alloc] init];
    NSString *name = self.iconsData[self.currentIconIndex][@"icon-name"];
    self.icon = [factory iconViewForIconNamed:name withSide:100];
    self.icon.color = [UIColor whiteColor];
    [self.view addSubview:self.icon];
    
    if (self.iconsData[self.currentIconIndex][@"baseline-adjustement"]) {
        self.baselineAdjustementStepper.value = [self.iconsData[self.currentIconIndex][@"baseline-adjustement"] floatValue];
    } else {
        self.baselineAdjustementStepper.value = 1;
    }
    if (self.iconsData[self.currentIconIndex][@"scale-adjustement"]) {
        self.scaleAdjustementStepper.value = [self.iconsData[self.currentIconIndex][@"scale-adjustement"] floatValue];
    } else {
        self.scaleAdjustementStepper.value = 1;
    }
    
    [self.view setNeedsLayout];
    [self reloadIconMetrics];
}

- (void)reloadIconMetrics
{
    self.icon.baselineAdjustement = self.baselineAdjustementStepper.value;
    self.iconsData[self.currentIconIndex][@"baseline-adjustement"] = @(self.baselineAdjustementStepper.value);
    self.icon.scaleAdjustement = self.scaleAdjustementStepper.value;;
    self.iconsData[self.currentIconIndex][@"scale-adjustement"] = @(self.scaleAdjustementStepper.value);
    self.icon.proportionalOffsetTop = self.offsetTopStepper.value;
    [self.icon setNeedsLayout];
    
    self.baselineAdjustementLabel.text = [NSString stringWithFormat:@"baseline adjustement: %.2f", self.baselineAdjustementStepper.value];
    self.scaleAdjustementLabel.text = [NSString stringWithFormat:@"scale adjustement: %.2f", self.scaleAdjustementStepper.value];
    self.offsetTopLabel.text = [NSString stringWithFormat:@"proportional offset top: %.2f", self.offsetTopStepper.value];
}

- (void)applyPreviousIconSettings
{
    if (self.currentIconIndex > 0) {
        self.baselineAdjustementStepper.value = [self.iconsData[self.currentIconIndex - 1][@"baseline-adjustement"] floatValue];
        self.scaleAdjustementStepper.value = [self.iconsData[self.currentIconIndex - 1][@"scale-adjustement"] floatValue];
        
        [self reloadIconMetrics];
    }
}

#pragma mark - Load Fonts

- (void)loadIconsData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MTFontIcon" ofType:@"plist"];
    NSDictionary *settingsDictionary = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }

    self.iconsData = [NSMutableArray array];
    [settingsDictionary[@"font-icons"] enumerateObjectsUsingBlock:^(NSDictionary *iconData, NSUInteger idx, BOOL *stop) {
        [self.iconsData addObject:iconData.mutableCopy];
    }];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.iconsData count];
}

#pragma mark - UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label;
    if (view) {
        label = (UILabel *)view;
    } else {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    NSString *iconName = self.iconsData[row][@"icon-name"];
    label.text = iconName;
    
    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentIconIndex = row;
    [self loadCurrentIcon];
}

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
