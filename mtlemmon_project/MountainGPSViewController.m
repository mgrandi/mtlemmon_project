//
//  MountainGPSViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "MountainGPSViewController.h"
#import "MtLemmonAnnotation.h"
#import <MapKit/MKPinAnnotationView.h>
#import "MolinoCanyonViewController.h"
#import "BearCanyonViewController.h"
#import "WindyPointViewController.h"
#import "InspirationRockViewController.h"
#import "JournalCreateViewController.h"

/*
 This is the ViewController for the Google-maps GPS map view.  It contains 4
 annotation views that when clicked on can direct the user to more information
 about the given point.
 */
@implementation MountainGPSViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // create the location manager and set its delegate
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
 
        CGRect uiViewBounds = self.view.bounds;
        
        // set the frame to be the size of the size of the view (the UIImageView)
        self.view.frame = CGRectMake(uiViewBounds.origin.x, uiViewBounds.origin.y, uiViewBounds.size.width, uiViewBounds.size.height);
        
        
        // add the MKMapView
        mapView = [[MKMapView alloc] init]; 
        mapView.delegate = self;
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
        [mapView addAnnotation:MCAnnotation];
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
        IRAnnotation.title = @"Inspiration Rock";
        IRAnnotation.subtitle = @"Click to see more";
        [mapView addAnnotation: IRAnnotation];
        [IRAnnotation release];
        
        // *********************************************
        // Create back button for the GPS map page
        // *********************************************
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBack addTarget:self 
                       action:@selector(returnToPrevious:)
             forControlEvents:UIControlEventTouchDown];
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        // The color used for this button is based on the official UA colors
        [buttonBack setTitleColor:[[UIColor alloc] initWithRed:0.0 green:51.0/256.0 blue:102.0/256.0 alpha:1.0] forState:UIControlStateNormal];
        buttonBack.frame = CGRectMake(20.0, ([UIScreen mainScreen].bounds.size.height - 70), 60.0, 35.0);
        [self.view addSubview:buttonBack];
        
        // ************
        // create the journal button for the top right
        // *************
        
        UIButton *journalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [journalButton setTitle:@"Journal" forState:UIControlStateNormal];
        
        // add selector
        [journalButton addTarget:self action:@selector(journalButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:journalButton];
        
        
        // set the frame
        journalButton.frame = CGRectMake(210, 10, 90, 28);
        
        // start updating for a location
        [locationManager startUpdatingLocation];
        
    }
    return self;
}

// method to implement for location services
// gets called when the location manager gets an update.
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    // we got a location: make sure its not cached...
    NSTimeInterval timeInterval = [[newLocation timestamp] timeIntervalSinceNow];
    
    if ( timeInterval < -180.0 ) {
        // This is cached data, you do not want it, keep looking
        NSLog(@"gps view: time interval is invalid");
        return;
    }
    
    
    NSLog(@"gps view: location services got a location! %@", newLocation);
    
    // else: we got a valid location. create a mt lemmon annotation and put it on map view
    MtLemmonAnnotation *currentLocation = [[MtLemmonAnnotation alloc] initWithCoordinate:[newLocation coordinate]];
    [currentLocation setTitle:@"Current Location"];
    [currentLocation setSubtitle:@"Your current location"];
    [mapView addAnnotation:currentLocation];
    [currentLocation release];
        
    [manager stopUpdatingLocation];
    
    
}

// method to implement for location services
// gets called when the location manager gets an update
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    // check to see if this is a kCLErrorLocationUnknown error, 
    // which just means it could not get a location instantly, and to keep trying again
    if ([error code] == kCLErrorLocationUnknown) {
        
        NSLog(@"gps view: Location services unable to report location right away!");
        return;
        
    } 
    
    
    // any other error means we should stop the location manager.
    
    NSLog(@"gps view: Location manager got error: %@, stopping", error);
    
    [manager stopUpdatingLocation];
    
}


// method to implement for location services
// gets called when the location manager's authorization status changes.
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    
    // we might not need this, but if the new status is Denied, then we need to stop the location manager
    
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        
        
        NSLog(@"gps view: Location service authorization status is now denied or restricted! Stopping");
        
        [manager stopUpdatingLocation];
    }
    
}

// gets called when the journal button gets clicked
-(void) journalButtonPressed:(id) sender {
    
    NSLog(@"pressed");
    
    JournalCreateViewController *jcv = [[JournalCreateViewController alloc]initWithNibName:nil bundle:nil];
    [[self navigationController] pushViewController:jcv animated:YES];
    [jcv release];
    
    
}

// This method will be called when the Bear Canyon pin is pressed
-(void) bearCanyonPressed:(id)sender {
    BearCanyonViewController *bc = [[BearCanyonViewController alloc] init];
    [[self navigationController] pushViewController:bc animated:YES];
    [bc release];
}

// This method will be called when the Inspiration Rock pin is pressed
-(void) inspirationRockPressed:(id)sender {
    InspirationRockViewController *ir = [[InspirationRockViewController alloc] init];
    [[self navigationController] pushViewController:ir animated:YES];
    [ir release];
}

// This method will be called when the Windy Point pin is pressed
-(void) windyPointPressed:(id)sender {
    WindyPointViewController *wp = [[WindyPointViewController alloc] init];
    [[self navigationController] pushViewController:wp animated:YES];
    [wp release];
}

// This method will be called when the Molino Canyon pin is pressed
-(void) molinoCanyonPressed:(id)sender {
    MolinoCanyonViewController *mc = [[MolinoCanyonViewController alloc] init];
    [[self navigationController] pushViewController:mc animated:YES];
    [mc release];
}


-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
}

// Return to previous veiw
-(IBAction) returnToPrevious: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [mapView release];
    [super dealloc];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSLog(@"mapView method was called");
    static NSString* BridgeAnnotationIdentifier = @"bridgeAnnotationIdentifier";
    MKPinAnnotationView *MCPin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:BridgeAnnotationIdentifier] autorelease];
    
    MCPin.pinColor = MKPinAnnotationColorGreen;
    MCPin.animatesDrop = YES;
    MCPin.canShowCallout = YES;
    
    UIButton* MCButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    if ([annotation isEqual:MCAnnotation]) {
        [MCButton addTarget:self action:@selector(molinoCanyonPressed:) forControlEvents:UIControlEventTouchUpInside];
        MCPin.rightCalloutAccessoryView = MCButton;
    } else if ([annotation isEqual:BCAnnotation]) {
        [MCButton addTarget:self action:@selector(bearCanyonPressed:) forControlEvents:UIControlEventTouchUpInside];
        MCPin.rightCalloutAccessoryView = MCButton;
    } else if ([annotation isEqual:WPAnnotation]) {
        [MCButton addTarget:self action:@selector(windyPointPressed:) forControlEvents:UIControlEventTouchUpInside];
        MCPin.rightCalloutAccessoryView = MCButton;
    } else if ([annotation isEqual:IRAnnotation]) {
        [MCButton addTarget:self action:@selector(inspirationRockPressed:) forControlEvents:UIControlEventTouchUpInside];
        MCPin.rightCalloutAccessoryView = MCButton;
    }     
    return MCPin;
}

@end
