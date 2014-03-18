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
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.icon.center = self.view.center;
    self.frameView.center = self.view.center;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
