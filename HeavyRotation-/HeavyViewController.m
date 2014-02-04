//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by temp on 1/24/14.
//  Copyright (c) 2014 temp. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x
{
    // Return YES if incoming orientation is Portrait
    // or either of the Landscapes, otherwise, return NO
    return (x == UIInterfaceOrientationPortrait) || UIInterfaceOrientationIsLandscape(x);
}


@end
