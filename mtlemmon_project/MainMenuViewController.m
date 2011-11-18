//
//  MainMenuViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MountainMapViewController.h"


@implementation MainMenuViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // **************
        // Flandrau Logo
        // ***************
        // create the UIImage that is the pin
        UIImage *logo = [UIImage imageNamed:@"MainLogo.png"];
        UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [logoButton setImage:logo forState:UIControlStateNormal];
        [logoButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:logoButton];
        logoButton.frame = CGRectMake(30, 20, logo.size.width/2, logo.size.height/2);
        
        // **************
        // NSF Logo
        // ***************
        // create the UIImage that is the pin
        UIImage *logoNSF = [UIImage imageNamed:@"NSF_Logo.PNG"];
        UIButton *logoNSFButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [logoNSFButton setImage:logoNSF forState:UIControlStateNormal];
        [logoNSFButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:logoNSFButton];
        float imgWidth = logoNSF.size.width/10;
        float imgHeight = logoNSF.size.height/10;
        logoNSFButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - imgWidth - 15), ([UIScreen mainScreen].bounds.size.height - imgHeight - 30), imgWidth, imgHeight );
    }
    return self;
}

// This method will be called when the "Begin Static Tour" button is pressed
-(IBAction) staticTourPressed:(id)sender {
    MountainMapViewController *mm = [[MountainMapViewController alloc] init];
    [[self navigationController] pushViewController:mm animated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

@end
