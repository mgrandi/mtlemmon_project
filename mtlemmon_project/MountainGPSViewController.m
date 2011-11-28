//
//  MountainGPSViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MountainGPSViewController.h"

@implementation MountainGPSViewController

@synthesize tableview;
@synthesize mapView;
@synthesize shadowImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGRect uiViewBounds = self.view.bounds;
        
        // set the frame to be the size of the size of the view (the UIImageView)
        self.view.frame = CGRectMake(uiViewBounds.origin.x, uiViewBounds.origin.y, uiViewBounds.size.width, uiViewBounds.size.height);
        
        // add the MKMapView
        mapView = [[MKMapView alloc] init]; 
        mapView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20);
        // Using GPS coordinates from Summerhaven, AZ for the center struct
        MKCoordinateRegion region;
        region.center.latitude = 32.35386297889634;
        region.center.longitude = -110.73051452636719;
        region.span.latitudeDelta = 0.15;
        region.span.longitudeDelta = 0.0;
        mapView.region = region;
        self.mapView.mapType = MKMapTypeHybrid;
        
        [self.view addSubview: mapView];
        
        // *********************************************
        // Create back button for static map view
        // *********************************************
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBack addTarget:self 
                       action:@selector(returnToPrevious:)
             forControlEvents:UIControlEventTouchDown];
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        buttonBack.frame = CGRectMake(20.0, ([UIScreen mainScreen].bounds.size.height - 80), 60.0, 35.0);
        [self.view addSubview:buttonBack];
    }
    return self;
}

// Return to previous veiw
-(IBAction) returnToPrevious: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
