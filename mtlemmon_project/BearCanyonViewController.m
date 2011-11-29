//
//  BearCanyonViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BearCanyonViewController.h"

#import "BCFireScrollViewController.h"
#import "BCLifeZonesScrollViewController.h"

@implementation BearCanyonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *bg = [UIImage imageNamed:@"background_1.png"];
        UIImageView *bgv = [[UIImageView alloc] initWithImage: bg];
        [self.view addSubview: bgv];
        
        // *********************************************
        // Create Welcome Text
        // *********************************************
        UILabel *welcome = [[UILabel alloc] init ];
        welcome.numberOfLines = 0; // Allows for infinite number of lines
        welcome.lineBreakMode = UILineBreakModeWordWrap;
        [welcome setText: @"Welcome to Bear Canyon! \nWhat would you like to learn about?"];
        welcome.backgroundColor = [UIColor clearColor];
        welcome.textColor = [UIColor whiteColor];
        welcome.frame = CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width - 20.0, 50.0);
        [self.view addSubview: welcome];
        
        // *********************************************
        // Create Fire Button
        // *********************************************
        UIButton *buttonFire = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonFire addTarget:self 
                       action:@selector(firePressed:)
             forControlEvents:UIControlEventTouchDown];
        [buttonFire setTitle:@"Fire" forState:UIControlStateNormal];
        [buttonFire setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        buttonFire.frame = CGRectMake(20.0, 95.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonFire];
        
        UIBarButtonItem *test = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(journalButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:test];
        
        [test release];
        
        
        // *********************************************
        // Create Life Zones Button
        // *********************************************
        UIButton *buttonLZ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonLZ addTarget:self 
                       action:@selector(lZPressed:)
             forControlEvents:UIControlEventTouchDown];
        [buttonLZ setTitle:@"Life Zones" forState:UIControlStateNormal];
        [buttonLZ setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        buttonLZ.frame = CGRectMake(20.0, 150.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

// Do this action if the FIRE button is pressed
-(void) firePressed: (id) sender {
    BCFireScrollViewController *bcf = [[BCFireScrollViewController alloc] init];
    [[self navigationController] pushViewController:bcf animated:YES];
}

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    BCLifeZonesScrollViewController *bclz = [[BCLifeZonesScrollViewController alloc] init];
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
