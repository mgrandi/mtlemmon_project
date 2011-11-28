//
//  MountainGPSViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MountainGPSViewController.h"
#import "MtLemmonAnnotation.h"

@implementation MountainGPSViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGRect uiViewBounds = self.view.bounds;
        
        // set the frame to be the size of the size of the view (the UIImageView)
        self.view.frame = CGRectMake(uiViewBounds.origin.x, uiViewBounds.origin.y, uiViewBounds.size.width, uiViewBounds.size.height);
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    
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
    
    // Add the annotations for each stop along the Tour
    // Can use this website to find the GPS coordinates:
    // http://itouchmap.com/latlong.html
    
    // For Molino Canyon
    CLLocationCoordinate2D stop1Loc;
    stop1Loc.latitude = 32.33745015197181;
    stop1Loc.longitude = -110.69105386734009;
    MCAnnotation = [[MtLemmonAnnotation alloc]initWithCoordinate:stop1Loc];
    MCAnnotation.title = @"Molino Canyon";
    MCAnnotation.subtitle = @"Click to see more";
    [mapView addAnnotation: MCAnnotation];
    [MCAnnotation release];
    
    // For Bear Canyon
    CLLocationCoordinate2D stop2Loc;
    stop2Loc.latitude = 32.37418963583364;
    stop2Loc.longitude = -110.6917405128479;
    BCAnnotation = [[MtLemmonAnnotation alloc]initWithCoordinate:stop2Loc];
    BCAnnotation.title = @"Bear Canyon";
    BCAnnotation.subtitle = @"Click to see more";
    [mapView addAnnotation: BCAnnotation];
    [BCAnnotation release];
    
    // For Windy Point
    CLLocationCoordinate2D stop3Loc;
    stop3Loc.latitude = 32.36850579139593;
    stop3Loc.longitude = -110.71693181991577;
    WPAnnotation = [[MtLemmonAnnotation alloc]initWithCoordinate:stop3Loc];
    WPAnnotation.title = @"Windy Point";
    WPAnnotation.subtitle = @"Click to see more";
    [mapView addAnnotation: WPAnnotation];
    [WPAnnotation release];
    
    // For Inspiration Rock
    // Dont know if the coordinates for this one are exactly correct ???
    CLLocationCoordinate2D stop4Loc;
    stop4Loc.latitude = 32.43352129321256;
    stop4Loc.longitude = -110.751011967659;
    IRAnnotation = [[MtLemmonAnnotation alloc]initWithCoordinate:stop4Loc];
    IRAnnotation.title = @"Windy Point";
    IRAnnotation.subtitle = @"Click to see more";
    [mapView addAnnotation: IRAnnotation];
    [IRAnnotation release];
    
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

// Return to previous veiw
-(IBAction) returnToPrevious: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
