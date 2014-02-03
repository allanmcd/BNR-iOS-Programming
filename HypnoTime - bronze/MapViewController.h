//
//  MapViewController.h
//  HypnoTime
//
//  Created by Allan McDaniel on 1/23/14.
//  Copyright (c) 2014 Allan McDaniel. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
//    CLLocationManager *locationManager;
    IBOutlet MKMapView *mapView;
}
@end
