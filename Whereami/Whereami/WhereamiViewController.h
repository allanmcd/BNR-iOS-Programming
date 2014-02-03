//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Allan McDaniel on 1/6/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController
            <CLLocationManagerDelegate,
             MKMapViewDelegate,
             UITextFieldDelegate
            >
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;
@end
