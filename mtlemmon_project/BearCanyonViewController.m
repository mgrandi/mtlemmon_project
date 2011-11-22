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
        // Fire button
        // ***************
        UIImage *fire = [UIImage imageNamed:@"fireButton.PNG"];
        UIButton *fireButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [fireButton setImage:fire forState:UIControlStateNormal];
        [fireButton addTarget:self action:@selector(firePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview: fireButton];
        float imgWidth = fire.size.width/10;
        float imgHeight = fire.size.height/10;
        fireButton.frame = CGRectMake(3, 150, ([UIScreen mainScreen].bounds.size.width)-6, 65);
        
        
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
