//
//  BNRLogo.m
//  Hypnosister - gold
//
//  Created by Allan McDaniel on 1/20/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import "BNRLogo.h"

@implementation BNRLogo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        // All HypnosisViews start with a clear background color
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    UIColor *lightGradientColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    UIColor *darkGradientColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
    
    CGFloat locations[2] = {0.0, 1.0};
    CFArrayRef colors = (__bridge CFArrayRef) [NSArray arrayWithObjects:(id)lightGradientColor.CGColor,
                                      (id)darkGradientColor.CGColor,
                                      nil];
    
    CGColorSpaceRef colorSpc = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpc, colors, locations);
    
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0.5, 0.0), CGPointMake(0.5, 100.0), kCGGradientDrawsAfterEndLocation); //Adjust second point according to your view height
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
