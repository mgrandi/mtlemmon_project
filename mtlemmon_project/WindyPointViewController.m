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
#import "JournalCreateViewController.h"

@implementation WindyPointViewController

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
        [welcome setText: @"Welcome to Stop 3: \nWindy Point! \n\n\n\nWhat would you like to learn about?"];
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
        // Create Basin History Button
        // *********************************************
        UIButton *buttonBH = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBH addTarget:self 
                     action:@selector(bHPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonBH setTitle:@"Basin History" forState:UIControlStateNormal];
        [buttonBH setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        buttonBH.frame = CGRectMake(20.0, 215, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonBH];
        
        // *********************************************
        // Create Geology Button
        // *********************************************
        UIButton *buttonGeo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonGeo addTarget:self 
                     action:@selector(geoPressed:)
           forControlEvents:UIControlEventTouchDown];
        [buttonGeo setTitle:@"Geology" forState:UIControlStateNormal];
        [buttonGeo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        buttonGeo.frame = CGRectMake(20.0, 270, [UIScreen mainScreen].bounds.size.width - 40.0 , 35.0);
        [self.view addSubview:buttonGeo];
    }
    return self;
}

// Do this action if the LIFE ZONES button is pressed
-(void) lZPressed: (id) sender {
    WPLifeZonesScrollViewController *wplz = [[WPLifeZonesScrollViewController alloc] init];
    [[self navigationController] pushViewController:wplz animated:YES];
    [wplz release];
}

// Do this action if the BASIN HISTORY button is pressed
-(void) bHPressed: (id) sender {
    WPBasinScrollViewController *wpBas = [[WPBasinScrollViewController alloc] init];
    [[self navigationController] pushViewController:wpBas animated:YES];
    [wpBas release];
}

// Do this action if the GEOLOGY button is pressed
-(void) geoPressed: (id) sender {
    WPGeologyScrollViewController *wpGeo = [[WPGeologyScrollViewController alloc] init];
    [[self navigationController] pushViewController:wpGeo animated:YES];
    [wpGeo release];
}

// gets called when the user clicks the 'compose' button, the right button on the UINavigationBar
- (void)journalButtonClicked:(id) sender {
    
    
    JournalCreateViewController *jc = [[JournalCreateViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:jc animated:YES];
    [jc release];
    
    
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
