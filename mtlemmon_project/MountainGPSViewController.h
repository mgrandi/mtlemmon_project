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

@interface MountainGPSViewController : UIViewController 
{
	IBOutlet UITableView *tableview;
	IBOutlet MKMapView *mapView;
	IBOutlet UIImageView *shadowImage;
}

@property (nonatomic, retain) IBOutlet UITableView *tableview;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIImageView *shadowImage;

@end
