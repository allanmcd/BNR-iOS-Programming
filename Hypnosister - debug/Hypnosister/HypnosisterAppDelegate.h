//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Allan McDaniel on 1/16/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;


@end
