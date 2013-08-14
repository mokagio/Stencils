//
//  MTViewController.m
//  Example
//
//  Created by Gio on 14/08/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "MTViewController.h"

#import "MTFontIconFactory.h"

@interface MTViewController ()

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MTFontIconFactory *iconFactory = [[MTFontIconFactory alloc] init];
    [iconFactory dummyMethod];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
