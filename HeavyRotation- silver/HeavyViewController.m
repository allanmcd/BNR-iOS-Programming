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

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)x
                                         duration:(NSTimeInterval)duration
{
    // Assume "button" is a subview of this view controller's view
    
    UIColor *color = nil;
    CGRect bounds = [[self view] bounds];
    // If the orientation is rotating to Portrait mode...
    if (UIInterfaceOrientationIsPortrait(x)) {
        
        // Put the button in the top right corner
        [button setCenter:CGPointMake(bounds.size.width - 30, 20)];
        
        // the background color of the view will be red
        color = [UIColor redColor];
    } else {  // If the orientation is rotating to Landscape mode
        
        // Put the button in the bottom right corner
        [button setCenter:CGPointMake(bounds.size.width - 30,
                                      bounds.size.height - 20)];
        
        // the background color of the view will be blue
        color = [UIColor blueColor];
    }
    [[self view] setBackgroundColor:color];
}

@end
