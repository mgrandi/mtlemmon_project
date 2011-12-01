//
//  InspirationRockViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InspirationRockViewController.h"

#import "IRFireScrollViewController.h"
#import "IRGeologyScrollViewController.h"
#import "IRLifeZonesScrollViewController.h"

@implementation InspirationRockViewController

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

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    IRLifeZonesScrollViewController *irlz = [[IRLifeZonesScrollViewController alloc] init];
    [[self navigationController] pushViewController:irlz animated:YES];
}

// Do this action if the FIRE button is pressed
-(void) firePressed: (id) sender {
    IRFireScrollViewController *irFire = [[IRFireScrollViewController alloc] init];
    [[self navigationController] pushViewController:irFire animated:YES];
}

// Do this action if the GEOLOGY button is pressed
-(void) geoPressed: (id) sender {
    IRGeologyScrollViewController *irGeo = [[IRGeologyScrollViewController alloc] init];
    [[self navigationController] pushViewController:irGeo animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) viewDidAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
