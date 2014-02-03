//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Allan McDaniel on 1/21/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"



@implementation HypnosisViewController
HypnosisView *v;

- (void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    v = [[HypnosisView alloc] initWithFrame:frame];
    [v setCircleColor:[UIColor lightGrayColor]];
    // Set it as *the* view of this view controller
    [self setView:v];
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) {
        
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Hypnosis"];

        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
    }
    
    return self;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
    // create a segmented control to choose the color
    NSArray *buttonColors = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", nil];
    selectCircleColor = [[UISegmentedControl alloc] initWithItems:buttonColors];
    selectCircleColor.frame = CGRectMake(35,200,250,50);
    selectCircleColor.selectedSegmentIndex = 1;
    [selectCircleColor addTarget:self action:@selector(circleSelectorControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:selectCircleColor];

}
-(void)circleSelectorControl:(UISegmentedControl *)segment
{
    
    if(segment.selectedSegmentIndex == 0)
    {
        [v setCircleColor:[UIColor redColor]];
    }
    else if(segment.selectedSegmentIndex == 1)
    {
        [v setCircleColor:[UIColor greenColor]];
    }
    else if(segment.selectedSegmentIndex == 2)
    {
        [v setCircleColor:[UIColor blueColor]];
    }
    
    [v setNeedsDisplay];
}

@end
