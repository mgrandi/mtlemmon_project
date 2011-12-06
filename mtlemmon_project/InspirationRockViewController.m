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
        
        UIImage *bg = [UIImage imageNamed:@"background_1.png"];
        UIImageView *bgv = [[UIImageView alloc] initWithImage: bg];
        [self.view addSubview: bgv];
        [bgv release];
        
        
        // add the button to the top right of the navigation bar to take a journal entry
        UIBarButtonItem *journalButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(journalButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:journalButton];
        
        [journalButton release];
        
        // *********************************************
        // CreateWelcome Text
        // *********************************************
        UILabel *welcome = [[UILabel alloc] init ];
        welcome.numberOfLines = 0; // Allows for infinite number of lines
        welcome.lineBreakMode = UILineBreakModeWordWrap;
        [welcome setText: @"Welcome to Stop 4: \nInspiration Rock! \n\n\n\nWhat would you like to learn about?"];
        welcome.backgroundColor = [UIColor clearColor];
        welcome.textColor = [UIColor whiteColor];
        welcome.frame = CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width - 20.0, 130.0);
        [self.view addSubview: welcome];
        [welcome release];
        
        
        // *********************************************
        // Create Life Zones Button
        // *********************************************
        UIButton *buttonLZ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonLZ addTarget:self 
                     action:@selector(lZPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonLZ setTitle:@"Life Zones" forState:UIControlStateNormal];
        [buttonLZ setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        buttonLZ.frame = CGRectMake(20.0, 160.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonLZ];
        
        // *********************************************
        // Create Fire Button
        // *********************************************
        UIButton *buttonFire = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonFire addTarget:self 
                     action:@selector(firePressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonFire setTitle:@"Fire" forState:UIControlStateNormal];
        [buttonFire setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        buttonFire.frame = CGRectMake(20.0, 215.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonFire];
        
        // *********************************************
        // Create Geology Button
        // *********************************************
        UIButton *buttonGeo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonGeo addTarget:self 
                      action:@selector(geoPressed:)
            forControlEvents:UIControlEventTouchDown];
        [buttonGeo setTitle:@"Geology" forState:UIControlStateNormal];
        [buttonGeo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        buttonGeo.frame = CGRectMake(20.0, 270.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonGeo];
        
    }
    return self;
}

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    IRLifeZonesScrollViewController *irlz = [[IRLifeZonesScrollViewController alloc] init];
    [[self navigationController] pushViewController:irlz animated:YES];
    [irlz release];
}

// Do this action if the FIRE button is pressed
-(void) firePressed: (id) sender {
    IRFireScrollViewController *irFire = [[IRFireScrollViewController alloc] init];
    [[self navigationController] pushViewController:irFire animated:YES];
    [irFire release];
}

// Do this action if the GEOLOGY button is pressed
-(void) geoPressed: (id) sender {
    IRGeologyScrollViewController *irGeo = [[IRGeologyScrollViewController alloc] init];
    [[self navigationController] pushViewController:irGeo animated:YES];
    [irGeo release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
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
