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
        UIImage *logo = [UIImage imageNamed:@"LogoLarge.png"];
        
        UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [logoButton setImage:logo forState:UIControlStateNormal];
        [logoButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:logoButton];
        
        logoButton.frame = CGRectMake(30, 20, logo.size.width, logo.size.height);
    }
    return self;
}

// This method will be called when the "Begin Static Tour" button is pressed
-(IBAction) StaticTourPressed:(id)sender {
    MountainMapViewController *mm = [[MountainMapViewController alloc] init];
    [[self navigationController] pushViewController:mm animated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

@end
