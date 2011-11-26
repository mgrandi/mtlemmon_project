//
//  WindyPointViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WindyPointViewController.h"
#import "WPLifeZonesScrollViewController.h"
#import "WPGeologyScrollViewController.h"
#import "WPBasinScrollViewController.h"

@implementation WindyPointViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIImage *bg = [UIImage imageNamed:@"background_1.png"];
        UIImageView *bgv = [[UIImageView alloc] initWithImage: bg];
        [self.view addSubview: bgv];
        
        // *********************************************
        // CreateWelcome Text
        // *********************************************
        UILabel *welcome = [[UILabel alloc] init ];
        welcome.numberOfLines = 0; // Allows for infinite number of lines
        welcome.lineBreakMode = UILineBreakModeWordWrap;
        [welcome setText: @"Welcome to WindyPoint! \nWhat would you like to learn about?"];
        welcome.backgroundColor = [UIColor clearColor];
        welcome.textColor = [UIColor whiteColor];
        welcome.frame = CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width - 20.0, 50.0);
        [self.view addSubview: welcome];
        
        
        // *********************************************
        // Create Life Zones Button
        // *********************************************
        UIButton *buttonLZ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonLZ addTarget:self 
                       action:@selector(firePressed:)
             forControlEvents:UIControlEventTouchDown];
        [buttonLZ setTitle:@"Life Zones" forState:UIControlStateNormal];
        [buttonLZ setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        buttonLZ.frame = CGRectMake(20.0, 95.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonLZ];
        
        // *********************************************
        // Create Basin History Button
        // *********************************************
        UIButton *buttonBH = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBH addTarget:self 
                     action:@selector(BHPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonBH setTitle:@"Basin History" forState:UIControlStateNormal];
        [buttonBH setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        buttonBH.frame = CGRectMake(20.0, 150.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonBH];
        
        // *********************************************
        // Create Geology Button
        // *********************************************
        UIButton *buttonGeo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBH addTarget:self 
                     action:@selector(GeoPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonGeo setTitle:@"Geology" forState:UIControlStateNormal];
        [buttonGeo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        buttonGeo.frame = CGRectMake(20.0, 205.0, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonGeo];
    }
    return self;
}

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    WPLifeZonesScrollViewController *wplz = [[WPLifeZonesScrollViewController alloc] init];
    [[self navigationController] pushViewController:wplz animated:YES];
}

// Do this action if the GEOLOGY button is pressed
-(void) GeoPressed: (id) sender {
    WPGeologyScrollViewController *wpGeo = [[WPGeologyScrollViewController alloc] init];
    [[self navigationController] pushViewController:wpGeo animated:YES];
}

// Do this action if the BASIN HISTORY button is pressed
-(void) BHPressed: (id) sender {
    WPBasinScrollViewController *wpBas = [[WPBasinScrollViewController alloc] init];
    [[self navigationController] pushViewController:wpBas animated:YES];
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
