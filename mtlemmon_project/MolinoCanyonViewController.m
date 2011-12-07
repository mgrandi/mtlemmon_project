//
//  MolinoCanyonViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MolinoCanyonViewController.h"

#import "MCGeoHistoryScrollViewController.h"
#import "MCLifeZonesScrollViewController.h"

@implementation MolinoCanyonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *bg = [UIImage imageNamed:@"background_1.png"];
        UIImageView *bgv = [[UIImageView alloc] initWithImage: bg];
        [self.view addSubview: bgv];
        
        
        
        
        // add the button to the top right of the navigation bar to take a journal entry
        UIBarButtonItem *journalButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(journalButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:journalButton];
        
        [journalButton release];
        
        // *********************************************
        // Create Welcome Text
        // *********************************************
        UILabel *welcome = [[UILabel alloc] init ];
        welcome.numberOfLines = 0; // Allows for infinite number of lines
        welcome.lineBreakMode = UILineBreakModeWordWrap;
        [welcome setText: @"Welcome to Stop 1: \nMolino Canyon Overlook! \n\n\n\nWhat would you like to learn about?"];
        welcome.backgroundColor = [UIColor clearColor];
        welcome.textColor = [UIColor whiteColor];
        welcome.frame = CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width - 20.0, 130.0);
        [self.view addSubview: welcome];
        
        // *********************************************
        // Create Geo History Button
        // *********************************************
        UIButton *buttonGeo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonGeo addTarget:self 
                       action:@selector(geoPressed:)
             forControlEvents:UIControlEventTouchDown];
        [buttonGeo setTitle:@"Geo History" forState:UIControlStateNormal];
        [buttonGeo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        buttonGeo.frame = CGRectMake(20.0, 160.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonGeo];
        
        
        
        
        // *********************************************
        // Create Life Zones Button
        // *********************************************
        UIButton *buttonLZ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonLZ addTarget:self 
                     action:@selector(lZPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonLZ setTitle:@"Life Zones" forState:UIControlStateNormal];
        [buttonLZ setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        buttonLZ.frame = CGRectMake(20.0, 215.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonLZ];
    }
    return self;
}

- (void)journalButtonClicked:(id) sender {
    
    NSLog(@"hi");
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

-(void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

// Do this action if the FIRE button is pressed
-(void) geoPressed: (id) sender {
    MCGeoHistoryScrollViewController *mcgh = [[MCGeoHistoryScrollViewController alloc] init];
    [[self navigationController] pushViewController:mcgh animated:YES];
}

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    MCLifeZonesScrollViewController *bclz = [[MCLifeZonesScrollViewController alloc] init];
    [[self navigationController] pushViewController:bclz animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
