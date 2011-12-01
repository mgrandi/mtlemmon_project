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

        // add the button to the top right of the navigation bar to take a journal entry
        UIBarButtonItem *journalButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(journalButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:journalButton];
        
        [journalButton release];
    
    
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
