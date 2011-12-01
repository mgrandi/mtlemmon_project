//
//  MountainMapViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/5/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "MountainMapViewController.h"
#import "BearCanyonViewController.h"
#import "InspirationRockViewController.h"
#import "WindyPointViewController.h"
#import "MolinoCanyonViewController.h"

/*
 MountainMapViewController.m
 the view controller for the MountainMapView.xib file
 This is what gets called when the application first opens.
 Eventually it will be the map where you can select what stop you 
 want to go to.
 */
@implementation MountainMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGRect uiViewBounds = self.view.bounds;
        
        // set the frame to be the size of the size of the view (the UIImageView)
        self.view.frame = CGRectMake(uiViewBounds.origin.x, uiViewBounds.origin.y, uiViewBounds.size.width, uiViewBounds.size.height);
        
        // ************
        // create the journal button for the top right
        // *************
            
        UIButton *journalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [journalButton setTitle:@"Journal" forState:UIControlStateNormal];

        // add selector
        [journalButton addTarget:self action:@selector(journalButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:journalButton];
        
        
        // set the frame
        journalButton.frame = CGRectMake(210, 10, 90, 28);
        
        
        
        // **************
        // Bear Canyon Pin
        // ***************
        // create the UIImage that is the pin
        UIImage *bearCanyonPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
        
        UIButton *pinViewBearCanyon = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewBearCanyon setImage:bearCanyonPin forState:UIControlStateNormal];
        [pinViewBearCanyon addTarget:self action:@selector(bearCanyonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:pinViewBearCanyon];
        
        pinViewBearCanyon.frame = CGRectMake(226, 205, bearCanyonPin.size.width, bearCanyonPin.size.height);
        
        // **************
        // inspiration rock pin
        // ***************
        
        // create the UIImage that is the pin
        UIImage *inspirationRockPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
        
        UIButton *pinViewInspiration = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewInspiration setImage:inspirationRockPin forState:UIControlStateNormal];
        [pinViewInspiration addTarget:self action:@selector(inspirationRockPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:pinViewInspiration];
        
        pinViewInspiration.frame = CGRectMake(105, 25, inspirationRockPin.size.width, inspirationRockPin.size.height);
        
        // **************
        // Windy Point Vista pin
        // ***************
        
        // create the UIImage that is the pin
        UIImage *windyPointPin = [UIImage imageNamed:@"Blue_Map_Pin_small.png"];
                
        UIButton *pinViewWindy = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [pinViewWindy setImage:windyPointPin forState:UIControlStateNormal];
        [pinViewWindy addTarget:self action:@selector(windyPointPressed:) forControlEvents:UIControlEventTouchUpInside];
        
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
        [pinViewMolino addTarget:self action:@selector(molinoCanyonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the image view as a subview to the main imageview
        [self.view addSubview:pinViewMolino];
        
        pinViewMolino.frame = CGRectMake(230, 303, molinoPin.size.width, molinoPin.size.height);
        
        // *********************************************
        // Create back button for the static map page
        // *********************************************
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBack addTarget:self 
                       action:@selector(returnToPrevious:)
             forControlEvents:UIControlEventTouchDown];
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        // The color used for this button is based on the official UA colors
        [buttonBack setTitleColor:[[UIColor alloc] initWithRed:0.0 green:51.0/256.0 blue:102.0/256.0 alpha:1.0] forState:UIControlStateNormal];
        buttonBack.frame = CGRectMake(20.0, ([UIScreen mainScreen].bounds.size.height - 70), 60.0, 35.0);
        [self.view addSubview:buttonBack];
        
    }
    return self;
}

// gets called when the journal button gets clicked
-(void) journalButtonPressed:(id) sender {
    
    NSLog(@"pressed");
    
    
}

// This method will be called when the Bear Canyon pin is pressed
-(void) bearCanyonPressed:(id)sender {
    BearCanyonViewController *bc = [[BearCanyonViewController alloc] init];
    [[self navigationController] pushViewController:bc animated:YES];
}

// This method will be called when the Inspiration Rock pin is pressed
-(void) inspirationRockPressed:(id)sender {
    InspirationRockViewController *ir = [[InspirationRockViewController alloc] init];
    [[self navigationController] pushViewController:ir animated:YES];
}

// This method will be called when the Windy Point pin is pressed
-(void) windyPointPressed:(id)sender {
    WindyPointViewController *wp = [[WindyPointViewController alloc] init];
    [[self navigationController] pushViewController:wp animated:YES];
}

// This method will be called when the Molino Canyon pin is pressed
-(void) molinoCanyonPressed:(id)sender {
    MolinoCanyonViewController *mc = [[MolinoCanyonViewController alloc] init];
    [[self navigationController] pushViewController:mc animated:YES];
}

// Return to previous veiw
-(IBAction) returnToPrevious: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

@end