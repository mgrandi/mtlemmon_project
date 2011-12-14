//
//  MainMenuViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//  
//  This ViewController Controls the view of the main menu of the whole applicatin

// Here we import all necesarry header files
#import "MainMenuViewController.h"
#import "MountainMapViewController.h"
#import "MountainGPSViewController.h"
#import "AboutViewController.h"

// Begin implementation of this ViewController
@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // **************
        // Flandrau Logo
        // ***************
        // create the UIImage Flandrau/AU logo
        UIImage *logoImg = [UIImage imageNamed:@"MainLogoTrans.png"];
        UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainLogoTrans.png"]];
        logo.hidden = NO;
        logo.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, logoImg.size.height/2 );
        [[self view] addSubview:logo];
        
        
        // **************
        // NSF Logo
        // ***************
        // create the UIImage National Science Foundation logo
        UIImage *logoNSF = [UIImage imageNamed:@"NSF_Logo.PNG"];
        UIImageView *logoNSFImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NSF_Logo.PNG"]];
        logoNSFImage.hidden = NO;
        float imgWidth = logoNSF.size.width/10;
        float imgHeight = logoNSF.size.height/10;
        logoNSFImage.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - imgWidth - 15), ([UIScreen mainScreen].bounds.size.height - imgHeight - 30), imgWidth, imgHeight );
        [[self view] addSubview:logoNSFImage];
        
    }
    return self;
}

// This method will be called when the "Begin Static Tour" button is pressed
-(IBAction) staticTourPressed:(id)sender {
    MountainMapViewController *mm = [[MountainMapViewController alloc] init];
    [[self navigationController] pushViewController:mm animated:YES];
    [mm release];
}

// This method will be called when the "Begin GPS Tour" button is pressed
-(IBAction) GPSTourPressed:(id)sender {
    MountainGPSViewController *mGPS = [[MountainGPSViewController alloc] init];
    [[self navigationController] pushViewController:mGPS animated:YES];
    [mGPS release];
}

// This method will be called when the "About" button is pressed
-(IBAction) aboutPressed:(id)sender {
    AboutViewController *ab = [[AboutViewController alloc] init];
    [[self navigationController] pushViewController:ab animated:YES];
    [ab release];
}

- (void) logoPressed: (id) sender {
    // Do nothing for now.  Maybe we could have a link to the site from the logo?
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
