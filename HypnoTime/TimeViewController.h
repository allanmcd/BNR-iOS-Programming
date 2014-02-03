//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Allan McDaniel on 1/21/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
}
-(IBAction)showCurrentTime:(id)sender;
@end
