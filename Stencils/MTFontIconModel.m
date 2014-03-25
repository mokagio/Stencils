//
//  MTFontIconModel.m
//  
//
//  Created by Gio on 22/01/2014.
//
//

#import "MTFontIconModel.h"

@implementation MTFontIconModel

- (id)init
{
    self = [super init];
    if (!self) { return nil; }
    
    self.baselineAdjustement = 1;
    self.scaleAdjustement = 1;
    
    return self;
}

@end
