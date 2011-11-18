//
//  InspirationRockViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InspirationRockViewController.h"

@implementation InspirationRockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // *********************************************
        // Create back button for the about page
        // *********************************************
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBack addTarget:self 
                       action:@selector(returnToPrevious:)
             forControlEvents:UIControlEventTouchDown];
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        buttonBack.frame = CGRectMake(20.0, ([UIScreen mainScreen].bounds.size.height - 80), 60.0, 35.0);
        [self.view addSubview:buttonBack];
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
