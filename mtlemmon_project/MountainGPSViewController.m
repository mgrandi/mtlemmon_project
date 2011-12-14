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

@implementation MountainGPSViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
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
        
    }
    return self;
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


-(void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
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
    } else if ([annotation isEqual:BCAnnotation]) {
        [MCButton addTarget:self action:@selector(bearCanyonPressed:) forControlEvents:UIControlEventTouchUpInside];
    } else if ([annotation isEqual:WPAnnotation]) {
        [MCButton addTarget:self action:@selector(windyPointPressed:) forControlEvents:UIControlEventTouchUpInside];
    } else if ([annotation isEqual:IRAnnotation]) {
        [MCButton addTarget:self action:@selector(inspirationRockPressed:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [MCButton addTarget:self action:@selector(returnToPrevious:) forControlEvents:UIControlEventTouchUpInside];
    }
    MCPin.rightCalloutAccessoryView = MCButton;
    return MCPin;
}

@end
