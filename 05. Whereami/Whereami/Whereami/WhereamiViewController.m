//
//  WhereamiViewController.m
//  Whereami
//
//  Created by joeconway on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

//@interface WhereamiViewController()
//@property (nonatomic,retain) IBOutlet UISegmentedControl *mapTypeSelector;
//@end

@implementation WhereamiViewController

UILabel *label;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        locationManager = [[CLLocationManager alloc] init];        
        [locationManager setDelegate:self];        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

    }
    return self;
}

//Action method executes when user touches the button
-(void) pickOne:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSString *mapType = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
    NSLog(@"%@",mapType);
    switch(segmentedControl.selectedSegmentIndex)
    {
        case MKMapTypeStandard:
             worldView.mapType = MKMapTypeStandard;
             break;
        case MKMapTypeSatellite:
             worldView.mapType = MKMapTypeSatellite;
             break;
        case MKMapTypeHybrid:
             worldView.mapType = MKMapTypeHybrid;
             break;
    }
}

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
    [mapTypeSelector setTitle:@"Normal" forSegmentAtIndex:0];
    [mapTypeSelector setTitle:@"Satellite" forSegmentAtIndex:1];
    [mapTypeSelector setTitle:@"Hybrid" forSegmentAtIndex:2];
    [mapTypeSelector addTarget:self
                         action:@selector(pickOne:)
               forControlEvents:UIControlEventValueChanged];
}

- (BOOL)textFieldShouldReturn:(UITextField *)tf
{
    // This method isn't implemented yet - but will be soon.
    [self findLocation];
//    NSDate *now = [NSDate date];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSString *timeStamp = [formatter stringFromDate:now];
//     
//    tf.text = [NSString stringWithFormat:@"%@: %@",tf.text,timeStamp];
    [tf resignFirstResponder];
    
    return YES;
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of MapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord
                                                  title:[locationTitleField text]];
    // Add it to the map view 
    [worldView addAnnotation:mp];
        
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the 
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it.
    if (t < -180) {
        // This is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)u
{
    CLLocationCoordinate2D loc = [u coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (void)dealloc
{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}
@end
