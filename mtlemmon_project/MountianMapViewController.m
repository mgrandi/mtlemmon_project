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
        
        UIButton *pinViewBearCanyon = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewBearCanyon setImage:bearCanyonPin forState:UIControlStateNormal];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:pinViewBearCanyon];
        
        pinViewBearCanyon.frame = CGRectMake(226, 205, bearCanyonPin.size.width, bearCanyonPin.size.height);
        
        // **************
        // inspiration rock pin
        // ***************
        
        // create the UIImage that is the pin
        UIImage *inspirationRockPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];

        
        UIButton *pinViewinspiration = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewinspiration setImage:inspirationRockPin forState:UIControlStateNormal];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:pinViewinspiration];
        
        pinViewinspiration.frame = CGRectMake(105, 25, inspirationRockPin.size.width, inspirationRockPin.size.height);
        
        // **************
        // Windy Point Vista pin
        // ***************
        
        // create the UIImage that is the pin
        UIImage *windyPointPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
                
        UIButton *pinViewWindy = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewWindy setImage:windyPointPin forState:UIControlStateNormal];
        
        // add the image view as a subview to the main imageview
        [self.view addSubview:pinViewWindy];
        
        pinViewWindy.frame = CGRectMake(170, 213, windyPointPin.size.width, windyPointPin.size.height);
        
        
        // **************
        // Molino canyon pin
        // ***************
        
        // create the UIImage that is the pin
        UIImage *molinoPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
        
        UIButton *pinViewMolino = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewMolino setImage:molinoPin forState:UIControlStateNormal];
        
        // add the image view as a subview to the main imageview
        [self.view addSubview:pinViewMolino];
        
        pinViewMolino.frame = CGRectMake(230, 303, molinoPin.size.width, molinoPin.size.height);
        
        
        
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


-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

@end
