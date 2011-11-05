//
//  MountianMapViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MountianMapViewController.h"

/*
 MountianMapViewController.m
 the view controller for the MountianMapView.xib file
 This is what gets called when the application first opens.
 Eventually it will be the map where you can select what stop you 
 want to go to.
 
 
 */
@implementation MountianMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGRect uiViewBounds = self.view.bounds;
        
        // set the frame to be the size of the size of the view (the UIImageView)
        self.view.frame = CGRectMake(uiViewBounds.origin.x, uiViewBounds.origin.y, uiViewBounds.size.width, uiViewBounds.size.height);
        
        
        // **************
        // Bear Canyon Pin
        // ***************
        // create the UIImage that is the pin
        UIImage *bearCanyonPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
        
        
        // create the image view that will hold the pin
        UIImageView *pinView = [[UIImageView alloc] initWithImage:bearCanyonPin];
        
        // add the image view as a subview to the main imageview
        [self.view addSubview:pinView];
        
        pinView.frame = CGRectMake(226, 205, bearCanyonPin.size.width, bearCanyonPin.size.height);
        
        // **************
        // Windy Point Vista pin
        // ***************
        
        
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
