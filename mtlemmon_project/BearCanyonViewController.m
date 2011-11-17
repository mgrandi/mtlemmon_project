//
//  BearCanyonViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BearCanyonViewController.h"

@implementation BearCanyonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // **************
        // Create FIRE button
        // ***************
        // create the UIImage that is thebutton
        UIImage *fireImage = [UIImage imageNamed:@"fire.png"];
        
        UIButton *fireButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [fireButton setImage:fireImage forState:UIControlStateNormal];
        [fireButton addTarget:self action:@selector(firePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:fireButton];
        
        fireButton.frame = CGRectMake( ([UIScreen mainScreen].bounds.size.width/2) - (fireImage.size.width/2), 60, fireImage.size.width, fireImage.size.height);
        
        // **************
        // Create land button
        // ***************
        // create the UIImage that is thebutton
        UIImage *landImage = [UIImage imageNamed:@"land.png"];
        
        UIButton *landButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [landButton setImage:landImage forState:UIControlStateNormal];
        [landButton addTarget:self action:@selector(landPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:landButton];
        
        landButton.frame = CGRectMake( ([UIScreen mainScreen].bounds.size.width/2) - (landImage.size.width/2), 230, landImage.size.width, landImage.size.height);

    }
    return self;
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

// Do this action if the FIRE button is pressed
-(void) firePressed: (id) sender {
    // Do something here
}

// Do this action if the LAND button is pressed
-(void) landPressed: (id) sender {
    // Do something here
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
