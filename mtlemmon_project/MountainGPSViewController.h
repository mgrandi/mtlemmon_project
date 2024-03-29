//
//  MountainGPSViewController.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "MtLemmonAnnotation.h"

@interface MountainGPSViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
	IBOutlet MKMapView *mapView;
    MtLemmonAnnotation *BCAnnotation, *WPAnnotation, *MCAnnotation, *IRAnnotation;
    CLLocationManager *locationManager;
}

//- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
