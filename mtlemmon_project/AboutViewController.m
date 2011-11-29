//
//  AboutViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // **************
        // Flandrau Logo
        // ***************
        // create the UIImage that is the pin
        UIImage *logo = [UIImage imageNamed:@"MainLogoTrans.png"];
        UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [logoButton setImage:logo forState:UIControlStateNormal];
        [logoButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        // add the button as a subview to the main imageview
        [self.view addSubview:logoButton];
        logoButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, logo.size.height/2 );
        
        // *********************************************
        // Create back button for the about page
        // *********************************************
        UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonBack addTarget:self 
                       action:@selector(returnToPrevious:)
             forControlEvents:UIControlEventTouchDown];
        [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
        buttonBack.frame = CGRectMake(20.0, ([UIScreen mainScreen].bounds.size.height - 70), 60.0, 35.0);
        [self.view addSubview:buttonBack];
    }
    return self;
}

- (void) logoPressed: (id) sender {
    // Do nothing for now.  Maybe we could have a link to the site from the logo?
}

// Return to previous veiw
-(IBAction) returnToPrevious: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

@end
