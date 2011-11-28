//
//  MountainGPSViewController.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "MtLemmonAnnotation.h"

@interface MountainGPSViewController : UIViewController <MKAnnotation>
{
	IBOutlet MKMapView *mapView;
    MtLemmonAnnotation *BCAnnotation, *WPAnnotation, *MCAnnotation, *IRAnnotation;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;



@end
