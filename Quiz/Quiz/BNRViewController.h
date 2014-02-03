//
//  BNRViewController.h
//  Quiz
//
//  Created by Allan McDaniel on 1/2/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRViewController : UIViewController
{
    int currentQuestionIndex;

    // The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;

    // The view objects - don't worry about IBOutlet -
    // We'lll talk about it shortly
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}
-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
